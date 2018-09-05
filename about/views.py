# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from django.views.generic import TemplateView
from django.http import HttpResponse
from django.views import View
import json, traceback, sys
from about.models import About as AboutModel

class About(View):
    def get(self, request):
        about = AboutModel.objects.last()
        response = { 'about': about }
        return render(request, 'about.html', response)

    def post(self, request):
        try:
            about = AboutModel.objects.last()
            if not about:
                about = AboutModel (
                    mission = request.POST.get('mission'),
                    vission = request.POST.get('vission'),
                    address = request.POST.get('address'),
                    email = request.POST.get('email'),
                    phone = request.POST.get('phone'),
                    introductoryText = request.POST.get('textoIntroductorio'),
                    introductoryImage = request.FILES.get('introductoryImage', False)
                )
            else:
                about.mission = request.POST.get('mission')
                about.vission = request.POST.get('vission')
                about.address = request.POST.get('address')
                about.email = request.POST.get('email')
                about.phone = request.POST.get('phone')
                about.introductoryText = request.POST.get('textoIntroductorio')
                about.introductoryImage = request.FILES.get('introductoryImage', False)
            about.save()
            response = json.dumps({'status': 'True', 'message': 'Datos modificados satisfactoriamente.'})
        except Exception as inst:
            response = json.dumps({'status': 'False', 'message': str(inst)})
        return HttpResponse(response, content_type = 'application/json')

class History(View):
    def get(self, request):
        history = AboutModel.objects.last()
        response = { 'history': history }
        return render(request, 'history.html', response)

    def post(self, request):
        try:
            history = AboutModel.objects.last()
            if not history:
                history = AboutModel(history = request.POST.get('history'))
            else:
                history.history = request.POST.get('history')
            history.save()
            response = json.dumps({'status': 'True', 'message': 'Datos modificados satisfactoriamente.'})
        except Exception as inst:
            response = json.dumps({'status': 'False', 'message': str(inst)})
        return HttpResponse(response, content_type = 'application/json')
