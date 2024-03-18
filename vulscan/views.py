"""
===============
@author:maverick0407
@time:2023/4/21:17:26
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, HttpResponse
from django.contrib import messages
from django.http import JsonResponse
from django.core import serializers
from .models import ScanResult
import requests
import json
import time
from .awvs.awvs import awvs


# Create your views here.
@login_required
def vulscan(request):
    """
    漏洞扫描主页面的视图，用来获取前端传回来的目标地址在这里添加到awvs任务中，并且返回模板
    """
    if request.method == 'POST':
        url = request.POST['url_input']
        scan_option = request.POST['scan_option']
        awvs_obj = awvs()
        target_id = awvs_obj.add_target(url)  # 添加任务,并获得任务id
        awvs_obj.add_scan(target_id, scan_option)  # 将任务id放入扫描队列中，随即创建扫描对象并开始扫描
        messages.success(request, "任务添加成功！")

    return render(request, "vulscan/vulscan.html")


def vulscan_progress(request):
    """
    检查扫描进度，并且把完成的项目存入数据库中，且把一系列需要用到个数据作为ajax响应返回到前端页面中
    """
    awvs_obj = awvs()
    scan_id = awvs_obj.check_scan_id()  # 获得扫描对象的扫描id,获得的数据是一个列表，包括所有历史的扫描任务
    for scan in scan_id['scans']:
        print(scan)
        if scan['current_session']['status'] == 'completed':
            existing_results = ScanResult.objects.filter(target_url=scan['target']['address'],
                                                         scan_mode=scan['profile_name'])  # 查看数据库中有没有已经扫描过的数据
            if existing_results:
                pass
            # 如果数据库中没有就存入数据库
            else:  # 下面的所有数据都需要用到
                result = ScanResult(target_url=scan['target']['address'],
                                    target_id=scan['target_id'],
                                    scan_id=scan['scan_id'],
                                    low_vulns=scan['current_session']['severity_counts']['low'],
                                    info_vulns=scan['current_session']['severity_counts']['info'],
                                    medium_vulns=scan['current_session']['severity_counts']['medium'],
                                    high_vulns=scan['current_session']['severity_counts']['high'],
                                    total_vulns=scan['current_session']['severity_counts']['low'] +
                                                scan['current_session']['severity_counts']['info'] +
                                                scan['current_session']['severity_counts']['medium'] +
                                                scan['current_session']['severity_counts']['high'],
                                    created_time=scan['current_session']['start_date'],
                                    task_status=scan['current_session']['status'],
                                    scan_mode=scan['profile_name'])
                result.save()
    return JsonResponse(scan_id)

@login_required
def vul_detail(request):
    """
    进入每个扫描的详情页中，返回模板和相关数据
    """
    scan_id = request.GET.get('scan_id')
    scan_session_id = request.GET.get('scan_session_id')
    awvs_obj = awvs()
    # 很具scan_id和scan_session_id取的对应的数据
    vul_info = awvs_obj.vulnerabilities_info(scan_id, scan_session_id)
    vul_counts = awvs_obj.check_process(scan_id)
    target_id = vul_counts['target_id']
    scan_info = awvs_obj.scan_info(scan_id, scan_session_id)
    target_info = scan_info['scanning_app']['wvs']['hosts'][target_id]
    latest_vuln_info = scan_info['scanning_app']['wvs']['main']
    other_info = scan_info['scanning_app']['wvs']
    # print(scan_info['scanning_app']['wvs']['main']['duration'])
    return render(request, "vulscan/vul_detail.html",
                  {"vul_info": vul_info['vulnerabilities'],
                   "vul_counts": vul_counts,
                   "scan_id": scan_id,
                   "scan_session_id": scan_session_id,
                   "target_info": target_info,
                   "latest_vuln_info": latest_vuln_info,
                   "other_info": other_info})


def vul_detail_info(request):
    """
    拿到每个漏洞的详细信息，作为ajax响应返回到前端模板中
    """
    awvs_obj = awvs()
    vuln_id = request.GET.get("vuln_id")
    scan_id = request.GET.get("scan_id")
    scan_session_id = request.GET.get("scan_session_id")
    vuln_info = awvs_obj.vulnerabilities_detail_info(scan_id, scan_session_id, vuln_id)
    return JsonResponse(vuln_info)


def vul_report(request):
    """
    生成漏洞扫描报告的接口视图
    """
    awvs_obj = awvs()
    report_option = request.GET.get("report_option")
    report_type = request.GET.get("report_type")
    scan_id = request.GET.get("scan_id")
    print(report_option, report_type, scan_id)
    gen_id = awvs_obj.generate_report(scan_id, report_option)
    time.sleep(10)  # 生成扫描报告需要时间，为了避免生成中时返回空列表，所以睡眠10s给awvs足够的时间来生成漏洞扫描报告
    report_url = awvs_obj.get_report()
    print(report_url)
    return JsonResponse(report_url)
