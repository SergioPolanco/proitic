# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.core.urlresolvers import reverse
from django.conf import settings
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.core import serializers
from django.utils import timezone
from django.views.generic import TemplateView
import json, traceback
from .models import Testimony

@login_required
def testimony_add_view(request):
    return render(request, 'testimony/add.html')

@login_required
def testimony_modify_view(request):
    testimony_list = Testimony.objects.all().order_by('name')
    context = { 'testimony_list': testimony_list }
    return render(request, 'testimony/modify.html', context)

class search_testimony(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                row_id = int(request.POST.get('id'))
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                testimony_model = Testimony.objects.get(id=row_id)
                response_data = {}
                response_data['name'] = testimony_model.name
                response_data['id'] = testimony_model.id
                response_data['profession'] = testimony_model.profession
                response_data['expression'] = testimony_model.expression
                response_data['testimony'] = testimony_model.testimony
                response_data['email'] = testimony_model.email
                response_data['facebook'] = testimony_model.facebook
                response_data['twitter'] = testimony_model.twitter
                response_data['googlePlus'] = testimony_model.googlePlus
                response_data['active'] = bool(testimony_model.active)
                response_data['privacy'] = bool(testimony_model.privacy)
                response_data['photo'] = str(testimony_model.photo)
                response_data['status'] = str('True')
                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except Testimony.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, este testimonio no ha sido encontrado...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class create_testimony(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                name = request.POST.get('name')
                profession = request.POST.get('profession')
                expression = request.POST.get('expression')
                testimony = request.POST.get('testimony')
                email = request.POST.get('email')
                facebook = request.POST.get('facebook')
                twitter = request.POST.get('twitter')
                googlePlus = request.POST.get('googleplus')
                active = bool(request.POST.get('active'))
                privacy = bool(request.POST.get('viewcontact'))
                photo = request.FILES.get('avatar', False)
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                testimony_model = Testimony()
                testimony_model.name = name
                testimony_model.profession = profession
                testimony_model.expression = expression
                testimony_model.testimony = testimony
                testimony_model.email = email
                testimony_model.facebook = facebook
                testimony_model.twitter = twitter
                testimony_model.googlePlus = googlePlus
                testimony_model.active = active
                testimony_model.privacy = privacy
                testimony_model.photo = photo
                testimony_model.date_joined = timezone.now()
                testimony_model.save()
                message = {'status':'True','message': 'Datos ingresados satisfactoriamente.'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class modify_testimony(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':

            try:
                name = request.POST.get('name')
                row_id = int(request.POST.get('id'))
                profession = request.POST.get('profession')
                expression = request.POST.get('expression')
                testimony = request.POST.get('testimony')
                email = request.POST.get('email')
                facebook = request.POST.get('facebook')
                twitter = request.POST.get('twitter')
                googlePlus = request.POST.get('googleplus')
                active = bool(request.POST.get('active'))
                privacy = bool(request.POST.get('viewcontact'))
                photo = request.FILES.get('avatar', False)
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                testimony_model = Testimony.objects.get(id=row_id)
            except Testimony.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, este testimonio no ha sido encontrado...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                testimony_model.name = name
                testimony_model.profession = profession
                testimony_model.expression = expression
                testimony_model.testimony = testimony
                testimony_model.email = email
                testimony_model.facebook = facebook
                testimony_model.twitter = twitter
                testimony_model.googlePlus = googlePlus
                testimony_model.active = active
                testimony_model.privacy = privacy
                if photo:
                    testimony_model.photo = photo
                testimony_model.save()
                response_data = {}
                response_data['id'] = row_id
                response_data['name'] = name
                response_data['profession'] = profession
                response_data['active'] = bool(active)
                response_data['email'] = email
                response_data['status'] = str('True')
                response_data['message'] = str('Datos modificados satisfactoriamente.')
                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class delete_testimony(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                row_id = int(request.POST.get('id'))
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                testimony_model = Testimony.objects.get(id=row_id)
                testimony_model.delete()
                message = {'status':'True','message': 'Registro eliminado satisfactoriamente.'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except Testimony.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, este testimonio no ha sido encontrado...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
