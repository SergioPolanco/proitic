# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect
from django.core import serializers
from django.utils import timezone
from django.views.generic import TemplateView
import json, traceback
from .models import Article, Tag, Media, Category, Subcategory, BlogArticle
from investigator.models import Investigator
from django.db.models import Q
from django.views import generic
from django.contrib import messages

@method_decorator(login_required, name='dispatch')
class ArticleListView(generic.ListView):
    model = Article
    context_object_name = 'articles'   # your own name for the list as a template variable
    paginate_by = 7
    ordering = '-created_at'
    def get_queryset(self):
        
        print(list(messages.get_messages(self.request)))
        error_delete_post = self.request.session.pop("error_delete_post", False)
        ok_delete_post = self.request.session.pop('ok_delete_post', False)
        if ok_delete_post:
            messages.info(self.request, 'El articulo se ha borrado correctamente')
            # del self.request.session['ok_delete_post']
            # self.request.session.modified = True
            
        if error_delete_post: 
            messages.error(self.request, 'Ha ocurrido un error al eliminar el articulo')  
            # del self.request.session['error_delete_post']
            # self.request.session.modified = True
            
        if self.request.user.is_superuser:
            return Article.objects.all().order_by('-created_at')
        else:
            try:
                investigator_model = Investigator.objects.get(idCuenta=self.request.user.id)
                return Article.objects.filter(owner=investigator_model)
            except Investigator.DoesNotExist:
                pass
    
    template_name = 'blog/article_list.html'



@login_required
def blog_add_view(request):
    subcategory_list = Subcategory.objects.filter(active=True).order_by('name')
    context = { 'subcategory_list': subcategory_list }
    return render(request, 'blog/add.html', context)

@login_required
def category_view(request):
    subcategory_list = Subcategory.objects.all().order_by('name')
    category_list = Category.objects.filter(active=True).order_by('name')
    context = { 'subcategory_list': subcategory_list,'category_list': category_list }
    return render(request, 'blog/category.html', context)

@login_required
def post_detail(request, slug):
    article_list = Article.objects.get(slug=slug)
    if len(BlogArticle.objects.filter(article = article_list)) >0:
        blog_article = BlogArticle.objects.filter(article = article_list)[0]
    else:
        blog_article = False

    subcategory_list = Subcategory.objects.all().order_by('name')
    tag_list = Article.objects.get(slug=slug).get_string_tags()
    return render(request, 'blog/modify.html', {
        'article_list': article_list,
        'tag_list': tag_list,
        'subcategory_list': subcategory_list,
        'blog_article': blog_article
    })

def delete_post(request, slug):
    article = Article.objects.get(slug=slug)
    try:
        article.delete()
    except:
        request.session['error_delete_post'] = json.dumps({"error": "Ha ocurrido un error al eliminar el articulo"})  
        return redirect("list")
    else:
        request.session['ok_delete_post'] = json.dumps({"ok": "El articulo ha sido eliminado correctamente"})
        return redirect("list")
    

class create_blog(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':

            try:
                title = request.POST.get('title')
                city = request.POST.get('city')
                year = request.POST.get('year')
                active = request.POST.get('active')
                subcategory = request.POST.get('category')
                authors = request.POST.get('authors')
                tags = request.POST.get('tags')
                user = request.POST.get('user')
                body = request.POST.get('description')
                blog_active = bool(request.POST.get("blog_active"))
                description_blog = request.POST.get("description_blog")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if Article.objects.filter(title=title):
                    message = {'status':'False','message': 'Lo sentimos, este titulo ya ha siso registrado, por favor seleccione otro...'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except:
                    message = {'status':'False','message': str(traceback.format_exc())}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")

            try:
                investigator_model = Investigator.objects.get(userId=user)
            except Investigator.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, usted no tiene permiso para agregar un artículo...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                subcategory_model = Subcategory.objects.get(id=subcategory)
            except Subcategory.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, esta categoria no existe...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                # Guardando el articulo
                article_model = Article()
                article_model.title = title
                article_model.city = city
                article_model.year = year
                article_model.categorys = subcategory_model
                article_model.active = bool(active)
                article_model.body = body
                article_model.authors = authors
                article_model.owner = investigator_model
                article_model.created_at = timezone.now()
                article_model.update_at = timezone.now()
                article_model.save()

                if blog_active:
                    blog_article = BlogArticle()
                    blog_article.body = description_blog
                    blog_article.article = article_model
                    blog_article.save()

                # Guardando los tags
                tags = tags.split(',')
                for tag in tags:
                    try:
                        tag_model = Tag.objects.get(name=tag.strip().upper())
                        article_model.tags.add(tag_model)
                        article_model.save()
                    except Tag.DoesNotExist:
                        tags_model = Tag()
                        tags_model.name = tag.strip().upper()
                        tags_model.save()
                        article_model.tags.add(tags_model)
                        article_model.save()

                message = {'status':'True','message': 'Datos ingresados satisfactoriamente.'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class modify_blog(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':

            try:
                title = request.POST.get('title')
                city = request.POST.get('city')
                year = request.POST.get('year')
                active = request.POST.get('active')
                subcategory = request.POST.get('category')
                tags = request.POST.get('tags')
                body = request.POST.get('description')
                authors = request.POST.get('authors')
                row_id = request.POST.get('row_id')
                blog_active = bool(request.POST.get("blog_active"))
                description_blog = request.POST.get("description_blog")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            # Verificamos que el articulo exista
            try:
                article_model = Article.objects.get(id=row_id)
            except Article.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, este nombre de usuario no ha sido encontrado...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                subcategory_model = Subcategory.objects.get(id=subcategory)
            except Subcategory.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, esta categoria no existe...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            # Verificamos que el nombre del articulo no se repita
            try:
                articles_model = Article.objects.get(~Q(id = row_id),title=title)
                message = {'status':'False','message': 'Lo sentimos, el nombre de este artículo, ya ha sido registrado anteriormente...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except Article.DoesNotExist:
                article_model.title = title
                article_model.city = city
                article_model.year = year
                article_model.categorys = subcategory_model
                article_model.active = bool(active)
                article_model.body = body
                article_model.authors = authors
                article_model.update_at = timezone.now()
                article_model.save()

                if blog_active:
                    try:
                        blog_article = BlogArticle.objects.get(article = article_model)
                        blog_article.body = description_blog
                        blog_article.save()
                    except BlogArticle.DoesNotExist:
                        blog_article = BlogArticle()
                        blog_article.article = article_model
                        blog_article.body = description_blog
                        blog_article.save()
                else:
                    try:
                        blog_article = BlogArticle.objects.get(article = article_model)
                        blog_article.delete()
                    except BlogArticle.DoesNotExist:
                        pass

                # Eliminando los antiguos tags
                for tag in article_model.tags.all():
                    article_model.tags.remove(tag)

                # Guardando los nuevos tags
                tags = tags.split(',')
                for tag in tags:
                    try:
                        tag_model = Tag.objects.get(name=tag.strip().upper())
                        article_model.tags.add(tag_model)
                        article_model.save()
                    except Tag.DoesNotExist:
                        tags_model = Tag()
                        tags_model.name = tag.strip().upper()
                        tags_model.save()
                        article_model.tags.add(tags_model)
                        article_model.save()

                message = {'status':'True','message': 'Datos modificados satisfactoriamente.'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class Upload(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':

            try:
                photo = request.FILES.get('file-7', False)
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                # Guardando el articulo
                media_model = Media()
                if photo:
                    media_model.photo = photo
                    media_model.save()
                message = {'status':'True','message': '/media/' + str(media_model.photo) }
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class create_category(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':

            try:
                name = request.POST.get('nombre')
                category = request.POST.get('category')
                active = request.POST.get('active')
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                category_model = Category.objects.get(id=category)
            except Category.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, esta categoria no existe...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                # Guardando el articulo
                subcategory_model = Subcategory()
                subcategory_model.name = name
                subcategory_model.category = category_model
                subcategory_model.active = bool(active)
                subcategory_model.save()
                response_data = {}
                response_data['status'] = 'True'
                response_data['message'] = 'Datos modificados satisfactoriamente..'
                response_data['name'] = subcategory_model.name
                response_data['category'] = category_model.name
                response_data['active'] = bool(subcategory_model.active)
                response_data['id'] = subcategory_model.id
                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class modify_category(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':

            try:
                name = request.POST.get('nombre2')
                active = request.POST.get('active2')
                category = request.POST.get('category2')
                row_id = int(request.POST.get('id'))
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                subcategory_model = Subcategory.objects.get(id=row_id)
            except Subcategory.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, esta categoría no ha sido encontrada...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                category_model = Category.objects.get(id=category)
            except Category.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, esta categoria no existe...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                subcategory_model.name = name
                subcategory_model.category = category_model
                subcategory_model.active = bool(active)
                subcategory_model.save()

                response_data = {}
                response_data['id'] = row_id
                response_data['name'] = subcategory_model.name
                response_data['category'] = category_model.name
                response_data['categoryid'] = category_model.id
                response_data['active'] = bool(subcategory_model.active)
                response_data['status'] = str('True')
                response_data['message'] = str('Datos modificados satisfactoriamente.')
                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
