# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import PosGrade, Grade
from investigator import models as investigator_model
from django.views.generic import TemplateView
import json, traceback
from django.http import HttpResponse

# Create your views here.
@login_required
def grade_add_view(request):
    investigator_list = investigator_model.Investigator.objects.all()
    context = {'investigator_list': investigator_list}
    return render(request, 'grado/addGrade.html', context)

@login_required
def pos_grade_add_view(request):
    investigator_list = investigator_model.Investigator.objects.all()
    context = {'investigator_list': investigator_list}
    return render(request, 'posgrado/addPosgrade.html', context)

@login_required
def grade_modify_view(request):
    investigator_list = investigator_model.Investigator.objects.all()
    grade_list = Grade.objects.all()
    context = {'investigator_list': investigator_list,
                'grade_list': grade_list
                }
    return render(request, 'grado/modifyGrade.html', context)
@login_required
def posgrade_modify_view(request):
    investigator_list = investigator_model.Investigator.objects.all()
    posgrade_list = PosGrade.objects.all()
    context = {'investigator_list': investigator_list,
                'posgrade_list': posgrade_list
                }
    return render(request, 'posgrado/modifyPosgrade.html', context)
#Creando PosGrade
class create_pos_grade(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                estudiante = request.POST.get('txtEstudiantes')
                tutor = request.POST.get('txtTutor')
                titulo = request.POST.get('txtTitulo')
                fechaDef = request.POST.get('txtFecha')
                archivo = request.FILES.get('file', False)
                descripcion = request.POST.get('descripcion')
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if PosGrade.objects.filter(titulo = titulo):
                    message = {'status':'False','message': 'Lo sentimos, este título ya existe...'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if not investigator_model.Investigator.objects.filter(id = tutor):
                    message = {'status':'False','message': 'Lo sentimos, este autor no existe..'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
                else:
                    Investigator = investigator_model.Investigator.objects.get(id = tutor)

            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")


            try:
                posgrade_model = PosGrade()
                posgrade_model.estudiante = estudiante
                posgrade_model.tutor = Investigator
                posgrade_model.titulo = titulo
                posgrade_model.fechaDefensa = fechaDef
                posgrade_model.archivo = archivo
                posgrade_model.descripcion = descripcion
                posgrade_model.save()
                message = {'status':'True','message': 'Datos insertados correctamente...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class view_posgrade(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                idPostGrade = request.POST.get('idPosgrade')
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if not PosGrade.objects.filter(id = idPostGrade):
                    message = {'status':'False','message': "Lo sentimos este documento no existe"}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                postGrade = PosGrade.objects.get(id=idPostGrade)
                filename = str(postGrade.archivo).split("/")[1]
                response_data = {}
                response_data['status'] = "True"
                response_data['id'] = postGrade.id
                response_data['estudiantes'] = postGrade.estudiante
                response_data['tutor'] = postGrade.tutor.id
                response_data['titulo'] = postGrade.titulo
                response_data['fechaDefensa'] = postGrade.fechaDefensa.strftime("%Y-%m-%d")
                response_data['descripcion'] = postGrade.descripcion
                response_data['filename'] = filename
                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class modify_posGrade(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                idPostGradeForm = request.POST.get('idPosGradeForm')
                estudiante = request.POST.get('txtEstudiantes')
                tutor = request.POST.get('txtTutor')
                titulo = request.POST.get('txtTitulo')
                fechaDef = request.POST.get('txtFecha')
                archivo = request.FILES.get('file', False)
                descripcion = request.POST.get('descripcion')
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if not PosGrade.objects.filter(id = idPostGradeForm):
                    message = {'status':'False','message': "Lo sentimos este documento no existe"}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            #try:
                #if PosGrade.objects.filter(titulo = titulo):
                    #message = {'status':'False','message': 'Lo sentimos, este título ya existe...'}
                    #data = json.dumps(message)
                    #return HttpResponse(data, content_type =  "application/json")
            #except:
                #message = {'status':'False','message': str(traceback.format_exc())}
                #data = json.dumps(message)
                #return HttpResponse(data, content_type =  "application/json")

            try:
                if not investigator_model.Investigator.objects.filter(id = tutor):
                    message = {'status':'False','message': 'Lo sentimos, este autor no existe..'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
                else:
                    Investigator = investigator_model.Investigator.objects.get(id = tutor)

            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                posgrade_model = PosGrade.objects.get(id= idPostGradeForm)
                posgrade_model.estudiante = estudiante
                posgrade_model.tutor = Investigator
                posgrade_model.titulo = titulo
                posgrade_model.fechaDefensa = fechaDef
                if archivo:
                    posgrade_model.archivo = archivo
                posgrade_model.descripcion = descripcion
                posgrade_model.save()
                message = {'status':'True','message': 'Datos modificados correctamente...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

#Creando Grade

class create_grade(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                estudiante = request.POST.get('txtEstudiantes')
                tutor = request.POST.get('txtTutor')
                titulo = request.POST.get('txtTitulo')
                fechaDef = request.POST.get('txtFecha')
                archivo = request.FILES.get('file', False)
                descripcion = request.POST.get('descripcion')
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if Grade.objects.filter(titulo = titulo):
                    message = {'status':'False','message': 'Lo sentimos, este título ya existe...'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if not investigator_model.Investigator.objects.filter(id = tutor):
                    message = {'status':'False','message': 'Lo sentimos, este autor no existe..'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
                else:
                    Investigator = investigator_model.Investigator.objects.get(id = tutor)

            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")


            try:
                posgrade_model = Grade()
                posgrade_model.estudiante = estudiante
                posgrade_model.tutor = Investigator
                posgrade_model.titulo = titulo
                posgrade_model.fechaDefensa = fechaDef
                posgrade_model.archivo = archivo
                posgrade_model.descripcion = descripcion
                posgrade_model.save()
                message = {'status':'True','message': 'Datos insertados correctamente...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class view_grade(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                idGrade = request.POST.get('idGrade')
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if not Grade.objects.filter(id = idGrade):
                    message = {'status':'False','message': "Lo sentimos este documento no existe"}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                grade = Grade.objects.get(id=idGrade)
                filename = str(grade.archivo).split("/")[1]
                response_data = {}
                response_data['status'] = "True"
                response_data['id'] = grade.id
                response_data['estudiantes'] = grade.estudiante
                response_data['tutor'] = grade.tutor.id
                response_data['titulo'] = grade.titulo
                response_data['fechaDefensa'] = grade.fechaDefensa.strftime("%Y-%m-%d")
                response_data['descripcion'] = grade.descripcion
                response_data['filename'] = filename
                data = json.dumps(response_data)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

class modify_Grade(TemplateView):
    def post(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'POST':
            try:
                idGradeForm = request.POST.get('idGradeForm')
                estudiante = request.POST.get('txtEstudiantes')
                tutor = request.POST.get('txtTutor')
                titulo = request.POST.get('txtTitulo')
                fechaDef = request.POST.get('txtFecha')
                archivo = request.FILES.get('file', False)
                descripcion = request.POST.get('descripcion')
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                if not Grade.objects.filter(id = idGradeForm):
                    message = {'status':'False','message': "Lo sentimos este documento no existe"}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            #try:
                #if Grade.objects.filter(titulo = titulo):
                    #message = {'status':'False','message': 'Lo sentimos, este título ya existe...'}
                    #data = json.dumps(message)
                    #return HttpResponse(data, content_type =  "application/json")
            #except:
                #message = {'status':'False','message': str(traceback.format_exc())}
                #data = json.dumps(message)
                #return HttpResponse(data, content_type =  "application/json")

            try:
                if not investigator_model.Investigator.objects.filter(id = tutor):
                    message = {'status':'False','message': 'Lo sentimos, este autor no existe..'}
                    data = json.dumps(message)
                    return HttpResponse(data, content_type =  "application/json")
                else:
                    Investigator = investigator_model.Investigator.objects.get(id = tutor)

            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")

            try:
                grade_model = Grade.objects.get(id= idGradeForm)
                grade_model.estudiante = estudiante
                grade_model.tutor = Investigator
                grade_model.titulo = titulo
                grade_model.fechaDefensa = fechaDef
                if archivo:
                    grade_model.archivo = archivo
                grade_model.descripcion = descripcion
                grade_model.save()
                message = {'status':'True','message': 'Datos modificados correctamente...'}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
            except:
                message = {'status':'False','message': str(traceback.format_exc())}
                data = json.dumps(message)
                return HttpResponse(data, content_type =  "application/json")
