"""

webscan视图，用来加载首页

by:xhwdm 2023.03.27
"""

import threading
from celery.result import AsyncResult
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.core import serializers
from .models import CWE_INFO, Article_info
from vulscan.models import ScanResult
from celery_tasks.security_news.tasks import news
from vulscan.awvs.awvs import awvs
import time
import asyncio


# Create your views here.


@login_required
def web_index(request):
    """
    加载框架
    """
    return render(request, "webscan/index.html",{"username":request.user})


@login_required
def charts_index(request):
    """
    加载首页页面
    """
    cwe_info = CWE_INFO.objects.all()
    article_info = Article_info.objects.all().order_by('-date')
    vul_result = ScanResult.objects.all()
    awvs_obj = awvs()
    scan_id = awvs_obj.check_scan_id()  # 获得扫描对象的扫描id,获得的数据是一个列表，包括所有历史的扫描任务
    result = news.delay()
    return render(request, "webscan/index_v3.html",
                  {"cwe_info": cwe_info, "article_info": article_info, "vul_result": vul_result, "scan_id":scan_id})


def test(request):
    print(1)
    return render(request, "webscan/test.html")
