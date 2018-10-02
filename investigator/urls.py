# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.conf.urls import url
from . import views
from investigator.views import Investigator, showInvestigator

urlpatterns = [
    url(r'^new/$', login_required(Investigator.as_view()), name='newInvestigator'),
    url(r'^modify/$', views.showInvestigator, name='modifyInvestigator'),
    url(r'^investigatormodify/$', login_required(Investigator.as_view()), name='editInvestigator'),
]
