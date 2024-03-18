"""
===============
@author:maverick0407
@time:2023/3/21:17:26
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.contrib.auth.views import LogoutView
from django.urls import path
from . import views

urlpatterns = [
    path('', views.Login, name='login'),
    path('register/', views.register, name='register'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),
]