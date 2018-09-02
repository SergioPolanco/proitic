# -*- coding: utf-8 -*-
# encoding=utf8
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
from .models import UserProfile

@login_required
def profile_add_view(request):
    return render(request, 'accounts/add.html')

@login_required
def profile_modify_view(request):
    if request.user.is_superuser:
        user_list = User.objects.all().order_by('username')
    else:
        user_list = User.objects.filter(id=request.user.id)
    context = { 'user_list': user_list }
    return render(request, 'accounts/modify.html', context)

class create_account(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':

            try:
                username = request.POST.get('username')
                firstname = request.POST.get('firstname')
                lastname = request.POST.get('lastname')
                email = request.POST.get('email')
                admin = bool(request.POST.get('admin'))
                active = bool(request.POST.get('active'))
                newpassword = request.POST.get('newpassword')
                confirmpassword = request.POST.get('confirmpassword')
                photo = request.FILES.get('avatar', False)
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if User.objects.filter(username=username):
                    message = {'status':'False','message': 'Lo sentimos, este nombre de usuario ya ha siso registrado, por favor seleccione otro...'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except:
                    message = {'status':'False','message': str(traceback.format_exc())}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")

            try:
                user_model = User.objects.create_user(username=username, password=newpassword)
                user_model.email = email
                user_model.first_name = firstname
                user_model.last_name = lastname
                user_model.is_superuser = admin
                user_model.is_active = active
                user_model.is_staff = admin
                user_model.date_joined = timezone.now()
                user_model.save()

                user_profile = UserProfile()
                user_profile.user = user_model
                user_profile.photo = photo
                user_profile.save()

                message = {'status':'True','message': 'Datos ingresados satisfactoriamente.'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class modify_account(TemplateView):

    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                row_id = int(request.POST.get('id'))
                username = request.POST.get('username')
                firstname = request.POST.get('firstname')
                lastname = request.POST.get('lastname')
                email = request.POST.get('email')
                admin = bool(request.POST.get('admin'))
                active = bool(request.POST.get('active'))
                newpassword = request.POST.get('newpassword')
                confirmpassword = request.POST.get('confirmpassword')
                photo = request.FILES.get('avatar', False)
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                user_model = User.objects.get(username = username, id=row_id)
            except User.DoesNotExist:
                message = {'status':'False','message': 'Lo sentimos, este nombre de usuario no ha sido encontrado...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                user_model.email = email
                user_model.first_name = firstname
                user_model.last_name = lastname
                user_model.is_superuser = admin
                user_model.is_active = active
                user_model.is_staff = admin
                response_data = {}

                if newpassword == confirmpassword and newpassword:
                    user_model.set_password( newpassword )

                user_model.save()

                if photo:
                    try:
                        user_profile = UserProfile.objects.get(user_id = row_id)
                        user_profile.photo = photo
                        user_profile.save()
                        response_data['photo'] = '/media/' + str(user_profile.photo)
                    except UserProfile.DoesNotExist:
                        user_profile = UserProfile()
                        user_profile.user = user_model
                        user_profile.photo = photo
                        user_profile.save()
                        response_data['photo'] = '/media/' + str(user_profile.photo)

                response_data['status'] = 'True'
                response_data['message'] = 'Datos modificados satisfactoriamente..'
                response_data['email'] = email
                response_data['first_name'] = firstname
                response_data['is_superuser'] = admin
                response_data['is_active'] = active
                response_data['last_name'] = lastname
                response_data['id'] = row_id
                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
