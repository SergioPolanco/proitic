from django.conf.urls import url
from . import views
from index.views import sendMessage, Historia, Investigador

urlpatterns = [
    url(r'^$', views.index_view, name='index.index'),
    url(r'^historia/$', Historia.as_view(), name='historia'),
    url(r'^investigador/(?P<investigator>[-\w]+)/$', Investigador.as_view(), name='investigador'),
    url(r'^contactenos/$', views.contact_view, name='contact.index'),
    url(r'^cooperacion-vinculacion/$', views.projects_view, name='projects.index'),
    url(r'^articulos/$', views.news_view, name='news.index'),
    url(r'^testimonios/$', views.testimony_view, name='testimony.index'),
    url(r'^publicaciones/categorias/$', views.listcategory_view, name='blog.listcategory'),
    url(r'^publicaciones/categorias/(?P<slug>[-\w]+)/$', views.newscategory_view, name='blog.category'),
    url(r'^publicaciones/categorias/(?P<category>[-\w]+)/(?P<slug>[-\w]+)/$', views.post_detail, name='blog.detail'),
    url(r'^enviar_sugerencia', sendMessage.as_view()),
    url(r'^investigationLine/(?P<slug>[-\w]+)/$', views.line_detail, name='line.detail'),
    url(r'^investigationLines/$', views.lines_view, name='lines.index'),
    url(r'^posgrades/$', views.posgrades_view, name='posgrades.index'),
    url(r'^grades/$', views.grades_view, name='grades.index'),
    url(r'^grade/(?P<slug>[-\w]+)/$', views.grade_detail, name='grade.detail'),
    url(r'^posgrade/(?P<slug>[-\w]+)/$', views.posgrade_detail, name='posgrade.detail'),
    url(r'^blogs/$', views.blogs, name='blogs.index'),
    url(r'^blogs/(?P<category>[-\w]+)/(?P<slug>[-\w]+)/$', views.blog_article, name='blog_article.detail'),
    #url(r'^login/$', views.login_view, name='administrator.login'),
    #url(r'^logout/$', views.logout_view, name='administrator.logout'),
]
