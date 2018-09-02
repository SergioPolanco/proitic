from django.conf.urls import url

from . import views

urlpatterns = [
    #url(r'^$', views.index_view, name='perfiles.index'),
    url(r'^(?P<investigator>[0-9]+)/$', views.index_view, name='perfilesfalse.index'),
    #url(r'^login/$', views.login_view, name='administrator.login'),
    #url(r'^logout/$', views.logout_view, name='administrator.logout'),
]
