from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index_view, name='administrator.index'),
    url(r'^login/$', views.login_view, name='administrator.login'),
    url(r'^logout/$', views.logout_view, name='administrator.logout'),
]
