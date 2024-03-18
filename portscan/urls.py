"""
===============
@author:maverick0407
@time:2023/4/9
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""

from django.urls import path
from . import views

urlpatterns = [
    path("portscan", views.portscan, name="portscan"),
    path('portscan_progress', views.portscan_progress, name="portscan_progress"),
]
