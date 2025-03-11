"""
===============
@author:maverick0407
@time:2023/4/9
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.shortcuts import render
from celery.result import AsyncResult
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from .forms import PortScanForm
from .models import Port, ScanResult
from django.contrib import messages
from .forms import PortScanForm
from django.core import serializers
from celery_tasks.portscan.tasks import scan_port
from django.http import JsonResponse, HttpResponse
from django.core.cache import cache

"""
启动扫描功能和加载页面
"""

@login_required
def portscan(request):

    # 获取数据库中端口信息
    ports = Port.objects.all()
    if request.method == 'POST':
        # 清空session，避免session存储了上一次保存的数据
        request.session['task_id'] = None
        request.session['url'] = None
        # 检查用户输入url是否合规
        form = PortScanForm(request.POST)
        # 判断是否是合法的url
        if form.is_valid():
            # 不知道为什么端口检测不能加http或https，但是PortScanForm()这个函数又必须要求合法的url带着http或https，所以只有等到判断url合法之后再剪掉前面的http或https
            url = form.cleaned_data['url_input'].replace('http://', '').replace('https://', '').split('/')[0]
            # 把端口扫描的任务放在celery后台执行，并向session中存入当前任务的任务id和url
            result = scan_port.delay(url)
            request.session['task_id'] = result.id
            request.session['url'] = url
            messages.success(request, "扫描任务已经启动，请稍后！")
        else:
            form = PortScanForm()
            messages.warning(request, "url不合规，请重新输入！")
    return render(request, "portscan/portscan.html", {'ports': ports})



def portscan_progress(request):
    """
    前端ajax请求服务器的视图函数，通过轮询的方式判断后台任务执行情况并实时反馈给前端
    """

    if request.method == 'POST':
        # 从session中拿到任务id和正在扫描的url
        task_id = request.session.get('task_id')
        url = request.session.get('url')
        # 判断任务id是否存在
        if task_id:
            # 从session中取到的task_id只是一个字符串，需要通过AsyncResult()函数把他转换成task对象，才能进行对应的操作
            task = AsyncResult(task_id)
            if task.state == "PENDING":  # PENDING代表任务正在执行
                progress = cache.get("scan_progress_portscan")  # 从缓存中获取进度
                print(f"进度:{progress}")
                return JsonResponse({'task_state': "PENDING!!!", 'progress': progress})
            if task.state == "SUCCESS":  # SUCCESS代表任务执行完毕
                # 如果执行完毕，那么得到的开放端口数据应该会存入数据库，此时从数据库拿到任务扫描后返回的数据，并返回到前端页面去
                open_ports = ScanResult.objects.filter(url=url)
                json_data = serializers.serialize('json', open_ports)  # 将从数据库得到的数据序列化为json格式
                return JsonResponse({'task_state': "SUCCESS!!!", 'open_ports': json_data})
            else:
                return JsonResponse({'task_state': task.state})
        else:
            return JsonResponse({'task_state': "任务不存在！"})
    else:
        pass
