# -*- coding: utf-8 -*-
# encoding=utf8
from __future__ import unicode_literals
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.core import serializers
from django.utils import timezone
from django.views.generic import TemplateView
import json, traceback
from .models import Cooperation

@login_required
def cooperation_view(request):
    cooperation_list = Cooperation.objects.first()
    context = { 'cooperation_list': cooperation_list }
    return render(request, 'cooperation/index.html', context)

class modifyCooperation(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                description = request.POST.get('description')
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                cooperation_list = Cooperation.objects.first()
                if cooperation_list is not None:
                    cooperation_list.description = description
                    cooperation_list.save()
                    response_data = {}
                    response_data['status'] = 'True'
                    response_data['message'] = 'Datos modificados satisfactoriamente..'
                    data = json.dumps(response_data)
                    return HttpResponse(data, content_type =  "application/json")
                else:
                    cooperation_list = Cooperation()
                    cooperation_list.description = description
                    cooperation_list.save()
                    response_data = {}
                    response_data['status'] = 'True'
                    response_data['message'] = 'Datos modificados satisfactoriamente..'
                    data = json.dumps(response_data)
                    return HttpResponse(data, content_type =  "application/json")
            except Cooperation.DoesNotExist:
                message = {'status':'False','message': 'Registro no encontrado'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
