"""
===============
@author:maverick0407
@time:2023/4/10
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
# Create your views here.
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, HttpResponse
from celery_tasks.dirscan.tasks import scan_dir
from .models import ScanResult
from .forms import PortScanForm
from django.contrib import messages
from celery.result import AsyncResult
from django.http import JsonResponse
from django.core import serializers


@login_required
def dirscan(request):
    if request.method == 'POST':
        # 先清空上次扫描在session中存入的id和url
        request.session['dirscan_task_id'] = None
        request.session['dirscan_url'] = None
        # 检查用户输入url是否合规
        form = PortScanForm(request.POST)
        # 判断是否是合法的url
        if form.is_valid():
            # 目录扫描不能加http或https，但是PortScanForm()这个函数又必须要求合法的url带着http或https，所以只有等到判断url合法之后再剪掉前面的http或https
            url = form.cleaned_data['url_input'].replace('http://', '').replace('https://', '').split('/')[0]
            # 把目录扫描的任务放在celery后台执行，并向session中存入当前任务的任务id和url
            result = scan_dir.delay(url)
            request.session['dirscan_task_id'] = result.id
            request.session['dirscan_url'] = url
            messages.success(request, "扫描任务已经启动，请稍后！")
        else:
            form = PortScanForm()
            messages.warning(request, "url不合规，请重新输入！")
    return render(request, "dirscan/dirscan.html")


def dirscan_progress(request):
    if request.method == 'POST':
        try:
            # 尝试从session中拿到任务id和正在扫描的url
            task_id = request.session.get('dirscan_task_id')
            url = request.session.get('dirscan_url')
        except:
            return JsonResponse({'task_state': "任务不存在11！"})
        # 判断任务id是否存在
        if task_id:
            print(task_id, url)
            # 从session中取到的task_id只是一个字符串，需要通过AsyncResult()函数把他转换成task对象，才能进行对应的操作
            task = AsyncResult(task_id)
            if task.state == "PENDING":  # PENDING代表任务正在执行
                return JsonResponse({'task_state': "PENDING!!!"})
            if task.state == "SUCCESS":  # SUCCESS代表任务执行完毕
                # 如果执行完毕，那么得到的开放端口数据应该会存入数据库，此时从数据库拿到任务扫描后返回的数据，并返回到前端页面去
                dir_data = ScanResult.objects.filter(target_url=url)
                json_data = serializers.serialize('json', dir_data)  # 将从数据库得到的数据序列化为json格式
                return JsonResponse({'task_state': "SUCCESS!!!", 'dir_data': json_data})
            else:
                return JsonResponse({'task_state': task.state})
        else:
            return JsonResponse({'task_state': "任务不存在22！"})
    else:
        pass
