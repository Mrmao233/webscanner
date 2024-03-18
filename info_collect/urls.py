"""
===============
@author:maverick0407
@time:2023/4/12
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.urls import path
from . import views

urlpatterns = [
    path("seo", views.seo, name="seo"),
    path("seo_charts", views.seo_charts, name="seo_charts"),
    path("security", views.security, name="security"),
    path("cms", views.seo_charts, name="cms"),
]
