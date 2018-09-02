# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.core.urlresolvers import reverse
from django.conf import settings

@login_required
def index_view(request):
    return render(request, 'administrator/index.html')

def login_view(request):
    # Si el usuario esta ya logueado, lo redireccionamos a index_view
    if request.user.is_authenticated():
        return redirect(reverse('administrator.index'))

    mensaje = ''
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        remember = bool(request.POST.get('remember'))
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                if not remember:
                    settings.SESSION_EXPIRE_AT_BROWSER_CLOSE = True
                else:
                    settings.SESSION_EXPIRE_AT_BROWSER_CLOSE = False
                login(request, user)
                return redirect(reverse('administrator.login'))
            else:
                # Redireccionar informando que la cuenta esta inactiva
                pass
        mensaje = 'Usuario y/o contraseña incorrecta.'
    return render(request, 'administrator/login.html', {'mensaje': mensaje})

def logout_view(request):
    logout(request)
    return redirect(reverse('administrator.login'))
