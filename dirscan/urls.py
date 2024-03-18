"""
===============
@author:maverick0407
@time:2023/4/10
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.urls import path
from . import views

urlpatterns = [
    path("dirscan", views.dirscan, name="dirscan"),
    path('dirscan_progress', views.dirscan_progress, name="dirscan_progress"),
]
