"""
===============
@author:maverick0407
@time:2023/4/15
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""

from django.urls import path
from . import views

urlpatterns = [
    path("commonly_used", views.commonly_used, name="commonly_used"),
    path("ctf_webs", views.ctf_web, name="ctf_webs"),
]
