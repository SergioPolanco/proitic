# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import serve

urlpatterns = [
    url(r'^', include('index.urls')),
    url(r'^administrator/others/', include('about.urls')),
    url(r'^administrator/investigator/', include('investigator.urls')),
    #url(r'^perfiles', include('investigator.urls')),
    url(r'^news', include('news.urls')),
    url(r'^administrator/', include('administrator.urls')),
    url(r'^administrator/accounts/', include('accounts.urls')),
    url(r'^administrator/testimony/', include('testimony.urls')),
    url(r'^administrator/blog/', include('blog.urls')),
    url(r'^administrator/cooperation/', include('cooperation.urls')),
    url(r'^administrator/investigationLines/', include('investigationLines.urls')),
    url(r'^administrator/graduationWork/', include('graduationWork.urls')),
]
if settings.DEBUG:
    urlpatterns += [
        url(r'^media/(?P<path>.*)$', serve, {
            'document_root': settings.MEDIA_ROOT,
        }),
    ]
