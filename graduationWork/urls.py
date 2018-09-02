from django.conf.urls import url
from . import views

urlpatterns = [
    #url(r'^$', views.grade_add_view, name='gradeAdd'),
    url(r'^addGrade/$', views.grade_add_view, name='gradeAdd'),
    url(r'^addPosGrade/$', views.pos_grade_add_view, name='posGradeAdd'),
    url(r'^modifyGrade/$', views.grade_modify_view, name='gradeModify'),
    url(r'^modifyPosGrade/$', views.posgrade_modify_view, name='posgradeModify'),
    url(r'^insertGrade/$', views.create_grade.as_view()),
    url(r'^insertPosGrade/$', views.create_pos_grade.as_view()),
    url(r'^viewGrade/$', views.view_grade.as_view()),
    url(r'^viewPosGrade/$', views.view_posgrade.as_view()),
    url(r'^updateGrade/$', views.modify_Grade.as_view()),
    url(r'^updatePosGrade/$', views.modify_posGrade.as_view()),
]
