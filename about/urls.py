# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.conf.urls import url
from about.views import About, History

urlpatterns = [
    url(r'^about/$', login_required(About.as_view()), name='about'),
    url(r'^history/$', login_required(History.as_view()), name='history'),
]
