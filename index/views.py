from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.views import View
from about.models import About as AboutModel
from accounts.models import UserProfile
from investigator import models as investigator_model
from testimony import models as testimony_model
from cooperation import models as cooperation_model
from django.db.models import Max, Min
from blog import models as blog_model
import smtplib
from django.views.generic import TemplateView
import email.mime.multipart
from email.mime.text import MIMEText
import json, traceback
from django.http import HttpResponse
from django.db.models import Max, Min
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from investigationLines import models as investigationLines_model
from graduationWork import models as graduationWork_model

class Historia(View):
    def get(self, request):
        context = ObtenerContexto(None)
        return render(request, 'historia.html', context)

class Investigador(View):
    def get(self, request, investigator):
        context = ObtenerContexto(None)
        idInvestigator = investigator
        investigator_info = investigator_model.Investigator.objects.get(slug=idInvestigator)
        if investigator_info.photo:
            investigator_photo = UserProfile.objects.get(user=investigator_info.userId).photo
        blog_list = blog_model.Article.objects.all().order_by('-id')[:20]
        blog_list_paginator = blog_model.Article.objects.filter(owner = investigator_info, active = True).order_by('-id')[:20]
        grade_list = graduationWork_model.Grade.objects.filter(tutor = investigator_info)
        posgrade_list = graduationWork_model.PosGrade.objects.filter(tutor = investigator_info)
        paginator = Paginator(blog_list_paginator, 6)
        page = request.GET.get('page')
        try:
            blogs_paginator = paginator.page(page)
        except PageNotAnInteger:
        # If page is not an integer, deliver first page.
            blogs_paginator = paginator.page(1)
        except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
            blogs_paginator = paginator.page(paginator.num_pages)
        context.update({
            'investigator_info': investigator_info,
            'blog_list': blog_list,
            'blogs_paginator': blogs_paginator,
            'grade_list': grade_list,
            'posgrade_list': posgrade_list,
            'investigator_photo': investigator_photo
        })
        return render(request, 'profile.html', context)

def ObtenerContexto(params):
    postgraduate_list = graduationWork_model.PosGrade.objects.all()[:5]
    pregraduate_list = graduationWork_model.Grade.objects.all()[:5]
    publication_list = blog_model.Subcategory.objects.filter(active = True, category_id__in=blog_model.Category.objects.filter(id=3))[:7]
    investigator_list = investigator_model.Investigator.objects.filter(active = True).order_by('names')
    about = AboutModel.objects.last()
    investigationLines_list = investigationLines_model.InvestigationLines.objects.all().order_by('titulo')

    context = {
        'about' : about,
        'postgraduate_list': postgraduate_list,
        'pregraduate_list': pregraduate_list,
        'publication_list': publication_list,
        'investigator_list': investigator_list,
        'params': params,
        'investigationLines_list': investigationLines_list
    }
    return context

# Create your views here.
def index_view(request):
    cooperation_list = cooperation_model.Cooperation.objects.first()
    blog_list = blog_model.Article.objects.all().order_by('-id')[:20]
    testimonys_list = testimony_model.Testimony.objects.filter(active=True).order_by('-id')[:10]
    context = {
        'testimonys_list': testimonys_list,
        'blog_list': blog_list,
        'cooperation_list': cooperation_list
    }
    context = ObtenerContexto(context)
    
    return render(request, 'index1.html', context)

def contact_view(request):
    context = ObtenerContexto(None)
    return render(request, 'contact.html', context)

def historys_view(request):
    history = AboutModel.objects.last()
    context = ObtenerContexto(history)
    return render(request, 'historys.html', context)

def projects_view(request):
    category_list = blog_model.Subcategory.objects.filter(category=1, active = True)
    article = blog_model.Article.objects.filter(active = True, categorys__in=category_list)
    cooperation_list = cooperation_model.Cooperation.objects.first()
    context = {
        'category_list' : category_list,
        'article' : article,
        'cooperation_list' : cooperation_list
    }
    context = ObtenerContexto(context)
    return render(request, 'activities.html', context)

def profile_view(request, *args, **kwargs):
    context = ObtenerContexto(None)
    idInvestigator = kwargs['investigator']
    investigator_info = investigator_model.Investigator.objects.get(slug=idInvestigator)
    blog_list = blog_model.Article.objects.all().order_by('-id')[:20]
    blog_list_paginator = blog_model.Article.objects.filter(owner = investigator_info, active = True).order_by('-id')[:20]
    grade_list = graduationWork_model.Grade.objects.filter(tutor = investigator_info)
    posgrade_list = graduationWork_model.PosGrade.objects.filter(tutor = investigator_info)
    paginator = Paginator(blog_list_paginator, 6)
    page = request.GET.get('page')
    try:
        blogs_paginator = paginator.page(page)
    except PageNotAnInteger:
    # If page is not an integer, deliver first page.
        blogs_paginator = paginator.page(1)
    except EmptyPage:
    # If page is out of range (e.g. 9999), deliver last page of results.
        blogs_paginator = paginator.page(paginator.num_pages)
    
    context.update({
        'investigator_info': investigator_info,
        'blog_list': blog_list,
        'blogs_paginator': blogs_paginator,
        'grade_list': grade_list,
        'posgrade_list': posgrade_list
    })
    return render(request, 'profile.html', context)

def news_view(request):
    blogs_list = blog_model.Article.objects.filter(active=True).order_by('-id')
    context = ObtenerContexto(blogs_list)
    return render(request, 'news.html', context)

def lines_view(request):
    investigationLines_list = investigationLines_model.InvestigationLines.objects.all().order_by('titulo')
    context = ObtenerContexto(None)
    context.update({'investigationLines_list': investigationLines_list})
    return render(request, 'lines.html', context)

def line_detail(request, slug):
    line = investigationLines_model.InvestigationLines.objects.get(slug = slug)
    context = ObtenerContexto(None)
    context.update({'line': line})
    return render(request, 'line.html', context)

def posgrades_view(request):
    posgrades_list = graduationWork_model.PosGrade.objects.all().order_by('titulo')
    context = ObtenerContexto(None)
    context.update({'posgrades_list': posgrades_list})
    return render(request, 'posgrades.html', context)

def grades_view(request):
    grades_list = graduationWork_model.Grade.objects.all().order_by('titulo')
    context = ObtenerContexto(None)
    context.update({'grades_list': grades_list})
    return render(request, 'grades.html', context)

def grade_detail(request, slug):
    grade = graduationWork_model.Grade.objects.get(slug = slug)
    context = ObtenerContexto(None)
    context.update({'grade': grade})
    return render(request, 'grade.html', context)

def posgrade_detail(request, slug):
    posgrade = graduationWork_model.PosGrade.objects.get(slug = slug)
    context = ObtenerContexto(None)
    context.update({'posgrade': posgrade})
    return render(request, 'posgrade.html', context)

def newscategory_view(request, slug):
    subcategory_list = blog_model.Subcategory.objects.get(slug=slug)
    blogs_list = blog_model.Article.objects.filter(categorys=subcategory_list, active=True)
    context = ObtenerContexto(blogs_list)
    return render(request, 'news.html', context)

def listcategory_view(request):
    options_list = blog_model.Subcategory.objects.filter(active=True).order_by('name')
    context = ObtenerContexto(options_list)
    return render(request, 'categorys.html', context)

def testimony_view(request):
    testimonys_list = testimony_model.Testimony.objects.filter(active=True).order_by('-id')
    context = ObtenerContexto(testimonys_list)
    return render(request, 'testimony_list.html', context)

def post_detail(request, category, slug):
    subcategory = blog_model.Subcategory.objects.get(slug=category)
    blog_list = blog_model.Article.objects.all().order_by('-id')[:6]
    blogs_list = blog_model.Article.objects.get(slug=slug, categorys=subcategory)
    tag_list = blog_model.Article.objects.get(slug=slug, categorys=subcategory).get_string_tags()
    print(blog_list)
    context = {
        'blogs_list' : blogs_list,
        'blog_list': blog_list,
        'tag_list' : tag_list
    }
    context = ObtenerContexto(context)
    return render(request, 'blog.html', context )

def blogs(request):
    blogs_list = blog_model.BlogArticle.objects.all()
    context = ObtenerContexto(None)
    context.update({'blogs_list': blogs_list})
    return render(request, 'blogs_articles.html', context)

def blog_article(request,category, slug):
    subcategory = blog_model.Subcategory.objects.get(slug=category)
    article = blog_model.Article.objects.get(slug = slug, categorys=subcategory)
    blog_article = blog_model.BlogArticle.objects.get(article = article)
    context = ObtenerContexto(None)
    context.update({'blog_article': blog_article})
    blog_list = blog_model.Article.objects.all().order_by('-id')[:20]
    context.update({'blog_list': blog_list})
    return render(request, 'blog_article.html', context)

class sendMessage(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                nombre = request.POST.get('txtNombre')
                correo = request.POST.get('txtCorreo')
                mensaje = MIMEText(request.POST.get('txtMensaje'))
                destinatarios = [investigator.correo for investigator in investigator_model.Investigator.objects.filter(active = True).order_by('names')]
                conn = smtplib.SMTP( "smtp.gmail.com:587")
                conn.ehlo()
                conn.starttls()
                conn.ehlo()
                conn.login( "sarec.uni@gmail.com" , "sarec.uni2016" )

                msg = email.mime.multipart.MIMEMultipart()
                msg['to'] = ", ".join(destinatarios)
                msg['from'] = "{} <{}>".format(nombre, correo)
                msg['subject'] = 'Sugerencia de SAREC'
                msg.attach(mensaje)
                msg.add_header('reply-to', correo)
                conn.sendmail(msg['from'], destinatarios, msg.as_string())

                message = {'status':'true','message': 'Hemos recibido tu mensaje, nos pondremos en contacto contigo muy pronto.'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except Exception as e:
                message = {'status':'false','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
