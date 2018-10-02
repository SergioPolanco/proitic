# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.views import View
import json, traceback, sys
from investigator.models import Investigator as InvestigatorModel
from django.contrib.auth.models import User


class Investigator(View):
    def get(self, request):
        users = User.objects.exclude(id__in = InvestigatorModel.objects.all().values_list('userId', flat = True))
        response = { 'users': users }
        return render(request, 'newInvestigator.html', response)

    def post(self, request):
        try:
            investigator = InvestigatorModel()
            investigator.names = request.POST.get('names')
            investigator.surnames = request.POST.get('surnames')
            investigator.birthdate = request.POST.get('birthdate')
            investigator.email = request.POST.get('email')
            investigator.phone = request.POST.get('phone')
            investigator.address = request.POST.get('address')
            investigator.workDepartment = request.POST.get('workDepartment')
            investigator.academicTitle = request.POST.get('academicTitle')
            investigator.photo = request.FILES.get('fotoPerfil', False)
            investigator.presentation = request.POST.get('presentation')
            investigator.userId = User.objects.get(id = int(request.POST.get('userId')))
            investigator.save()
            response = json.dumps({'status': 'True', 'message': 'Datos ingresados satisfactoriamente.'})
        except Exception as inst:
            response = json.dumps({'status': 'False', 'message': str(inst)})
        return HttpResponse(response, content_type = 'application/json')

    def put(self, request):
        print("entro a modify")
        try:
            key = int(request.PUT.get('txtId'))
            nombres = request.PUT.get('txtNombres')
            apellidos = request.PUT.get('txtApellidos')
            fechaNac = request.PUT.get('txtFechaNac')
            correo = request.PUT.get('txtCorreo')
            telefono = request.PUT.get('txtTelefono')
            direccion = request.PUT.get('txtDireccion')
            departamento = request.PUT.get('txtDepartamento')
            titulo = request.PUT.get('txtTitulo')
            fotoPerfil = request.FILES.get('fotoPerfil', False)
            activo = bool(request.PUT.get('activo'))
            presentacion = request.PUT.get('txtPresentacion')
            cuentaUsuario_model_modify = User.objects.get(id = int(request.PUT.get('cmbCuentaUsuario')))
        except:
            message = {'status':'False','message': str(traceback.format_exc())}
            data = json.dumps(message)
            return HttpResponse(data, content_type =  "application/json")

        try:
            investigator_model = Investigator.objects.get(id=key)
        except Investigator.DoesNotExist:
            message = {'status':'False','message': 'Lo sentimos, este investigador no ha sido encontrado...'}
            data = json.dumps(message)
            return HttpResponse(data, content_type =  "application/json")

        try:
            if fotoPerfil:
                investigator_model.photo = fotoPerfil
            investigator_model.names = nombres
            investigator_model.surnames = apellidos
            investigator_model.birthdate = fechaNac
            investigator_model.email = correo
            investigator_model.phone = telefono
            investigator_model.address = direccion
            investigator_model.workDepartment = departamento
            investigator_model.academicTitle = titulo
            investigator_model.active = activo
            investigator_model.presentation = presentacion
            investigator_model.userId = cuentaUsuario_model_modify
            response_data = {}
            investigator_model.save()

            response_data['status'] = 'True'
            response_data['message'] = 'Datos modificados satisfactoriamente..'
            response_data['key'] = investigator_model.id
            response_data['nombres'] = investigator_model.names
            response_data['apellidos'] = investigator_model.surnames
            response_data['fechaNac'] = investigator_model.birthdate
            response_data['correo'] = investigator_model.email
            response_data['telefono'] = investigator_model.phone
            response_data['direccion'] = investigator_model.address
            response_data['departamento'] = investigator_model.workDepartment
            response_data['titulo'] = investigator_model.academicTitle
            response_data['fotoPerfil'] = '/media/' + str(investigator_model.photo)
            response_data['activo'] = investigator_model.active
            response_data['presentacion'] = investigator_model.presentation
            response_data['idCuenta'] = request.POST.get('cmbCuentaUsuario')
            response_data['userName'] = User.objects.get(id = int(request.PUT.get('cmbCuentaUsuario'))).username
            data = json.dumps(response_data)
            return HttpResponse(data, content_type =  "application/json")
        except:
            message = {'status':'False','message': str(traceback.format_exc())}
            data = json.dumps(message)
            return HttpResponse(data, content_type =  "application/json")

@login_required
def showInvestigator(request):
    if request.user.is_superuser:
        investigator_list = InvestigatorModel.objects.all().order_by('names')
    else:
        investigator_list = InvestigatorModel.objects.filter(idCuenta=request.user.id)
    user_list = User.objects.all()
    context = { 'investigator_list': investigator_list,
                'user_list' : user_list}
    return render(request, 'modify.html', context)
