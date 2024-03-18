from django.test import TestCase
# Create your tests here.
from django.core import serializers
from django.http import HttpResponse
from celery.result import AsyncResult
from django.http import JsonResponse, HttpResponse
from django.contrib import messages
from django.core import serializers
from celery_tasks.portscan.tasks import scan_port
import time
import asyncio
# Create your views here.

from webscan.models import ScanResult
def my_view(request):
    my_data = ScanResult.objects.filter(url="www.baidu.com") # 使用filter查询你需要返回的数据
    json_data = serializers.serialize('json', my_data) # 将查询结果转换为json格式
    print(json_data)
