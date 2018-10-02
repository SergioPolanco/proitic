# -*- coding: utf-8 -*-
# encoding=utf8
from __future__ import unicode_literals
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.views.generic import TemplateView
from .models import InvestigationLines
import json, traceback
# Create your views here.

@login_required
def investigation_lines_add_view(request):
    return render(request, 'addLine.html')
    #return HttpResponse("Hello, world. You're at the polls index.")

@login_required
def investigation_lines_modify_view(request):
    line_list = InvestigationLines.objects.all().order_by('titulo')
    context = {'line_list': line_list}
    return render(request, 'modifyLine.html',context)

class viewInvestigationLine(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                idLine = request.POST.get('idLine')
            except Exception as e:
                message = {'status':'1','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if not InvestigationLines.objects.filter(id = idLine):
                    message = {'status':'2','message': 'Lo sentimos, esta linea de investigación no existe...'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except Exception as e:
                message = {'status':'1','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                line = InvestigationLines.objects.get(id = idLine)
                response_data = {}
                response_data['status'] = '3'
                response_data['id'] = line.id
                response_data['titulo'] = line.titulo
                response_data['descripcion'] = line.descripcion


                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'1','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")


class createNewLine(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                tittle = request.POST.get('txtTitulo')
                description = request.POST.get('txtDescripcion')
            except Exception as e:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                new_line = InvestigationLines()
                new_line.titulo = tittle
                new_line.descripcion = description
                new_line.save()
                response_data = {}
                response_data['status'] = 'True'
                response_data['message'] = 'Datos modificados satisfactoriamente..'
                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")

            except Exception as e:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class modifyLine(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                idFormLine = request.POST.get('idFormLine')
                tittle = request.POST.get('txtTitulo')
                description = request.POST.get('txtDescripcion')
            except Exception as e:
                message = {'status':'1','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if not InvestigationLines.objects.filter(id = int(idFormLine)):
                    message = {'status':'2','message': 'Lo sentimos, esta linea de investigación no existe...'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except Exception as e:
                message = {'status':'1','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                line = InvestigationLines.objects.get(id = idFormLine)
                line.titulo = tittle
                line.descripcion = description
                line.save()
                response_data = {}
                response_data['status'] = '3'
                response_data['message'] = 'Dato modificado correctamente'

                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'1','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
