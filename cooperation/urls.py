from django.conf.urls import url

from . import views
from .views import cooperation_view, modifyCooperation

urlpatterns = [
    url(r'^$', views.cooperation_view, name='cooperation.index'),
    url(r'^update/$', modifyCooperation.as_view()),
]
