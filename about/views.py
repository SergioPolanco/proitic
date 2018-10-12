# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from io import BytesIO
from django.shortcuts import render
from django.views.generic import TemplateView
from django.http import HttpResponse
from django.views import View
import json, traceback, sys
from django.core import serializers
from rest_framework.parsers import JSONParser
from rest_framework.parsers import FileUploadParser
from rest_framework.exceptions import ParseError
from about.models import About as AboutModel
from about.schemas import AboutSchema

class About(View):
    parser_classes = (FileUploadParser,)
    def get(self, request):
        about = AboutModel.objects.last()
        response = { 'about': about }
        return render(request, 'about.html', response)

    def post(self, request):
        about = AboutModel.objects.last()
        payload = BytesIO(request.body)
        try:
            json_data = JSONParser().parse(payload)
            print(json_data)
        except ParseError as err:
            return HttpResponse(err, status=400)

        if not about:
            # about = AboutModel (
            #     mission = request.POST.get('mission'),
            #     vission = request.POST.get('vission'),
            #     address = request.POST.get('address'),
            #     email = request.POST.get('email'),
            #     phone = request.POST.get('phone'),
            #     introductoryText = request.POST.get('textoIntroductorio'),
            #     introductoryImage = request.FILES.get('introductoryImage', False)
            # )
            parsed_data = AboutSchema(data=json_data)

            if not parsed_data.is_valid():
                return HttpResponse(json.dumps(parsed_data.errors), status=400)

            parsed_data.save()
            return HttpResponse(status=200)
        else:
            parsed_data = AboutSchema(about, data=json_data)

            if not parsed_data.is_valid():
                return HttpResponse(json.dumps(parsed_data.errors), status=400)
            
            parsed_data.save()
            return HttpResponse(status=200)
        #     about.mission = parsed_data["mission"]["value"]
        #     about.vission = parsed_data["vission"]
        #     about.address = parsed_data["address"]
        #     about.email = parsed_data["email"]
        #     about.phone = parsed_data["phone"]
        #     about.introductoryText = parsed_data["introductoryText"]
        #     about.introductoryImage = request.FILES.get('introductoryImage', False)
        # about.save()


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
