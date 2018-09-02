from django.conf.urls import url

from . import views
from .views import create_testimony, modify_testimony, testimony_modify_view, testimony_add_view, search_testimony, delete_testimony

urlpatterns = [
    url(r'^$', views.testimony_add_view, name='testimony.add'),
    url(r'^add/$', views.testimony_add_view, name='testimony.add'),
    url(r'^insert/$', create_testimony.as_view()),
    url(r'^update/$', modify_testimony.as_view()),
    url(r'^delete/$', delete_testimony.as_view()),
    url(r'^search/$', search_testimony.as_view()),
    url(r'^modify/$', testimony_modify_view, name='testimony.modify'),
]
