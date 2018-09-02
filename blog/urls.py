from django.conf.urls import url

from . import views
from .views import blog_add_view, create_blog, post_detail, modify_blog, Upload, category_view, create_category, modify_category

urlpatterns = [
    url(r'^$', views.ArticleListView.as_view(), name='list'),
    url(r'^add/$', views.blog_add_view, name='blog.add'),
    url(r'^insert/$', create_blog.as_view()),
    url(r'^update/$', modify_blog.as_view()),
    url(r'^category/insert/$', create_category.as_view()),
    url(r'^category/modify/$', modify_category.as_view()),
    url(r'^(?P<slug>[-\w]+)/$', views.post_detail, name='blog.modify'),
    url(r'^delete_post/(?P<slug>[-\w]+)/$', views.delete_post, name='blog.delete'),
    url(r'^upload/media/$', Upload.as_view()),
    url(r'^category/list/$', views.category_view, name='blog.category'),
]
