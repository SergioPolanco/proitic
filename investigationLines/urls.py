from django.conf.urls import url
from .views import createNewLine, viewInvestigationLine, modifyLine
from . import views

urlpatterns = [
    url(r'^$', views.investigation_lines_add_view, name='investigationLinesAdd'),
    url(r'^add/$', views.investigation_lines_add_view, name='investigationLinesAdd'),
    url(r'^modify/$', views.investigation_lines_modify_view, name='investigationLinesModify'),
    url(r'^insert/$', createNewLine.as_view()),
    url(r'^view/$', viewInvestigationLine.as_view()),
    url(r'^update/$', modifyLine.as_view()),
]
