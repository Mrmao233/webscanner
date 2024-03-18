"""

webscan路由，用来加载首页

by:xhwdm 2023.03.27
"""

from django.urls import path
from django.contrib.auth.views import LogoutView
from . import views

urlpatterns = [
    path('', views.web_index, name="webscan"),
    path('charts_index', views.charts_index, name="charts_index"),
    path('test', views.test, name="test"),

]