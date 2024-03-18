"""
===============
@author:maverick0407
@time:2023/4/21:17:26
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""

from django.urls import path
from . import views

urlpatterns = [
    path("vulscan", views.vulscan, name="vulscan"),
    path("vulscan_progress", views.vulscan_progress, name="vulscan_progress"),
    path("vul_detail", views.vul_detail, name="vul_detail"),
    path("vul_detail_info", views.vul_detail_info, name="vul_detail_info"),
    path("vul_report",views.vul_report, name="vul_report"),
]
