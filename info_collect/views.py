"""
===============
@author:maverick0407
@time:2023/4/12
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, HttpResponse
from .get_info import GetData
from django.http import JsonResponse
import time
from django.contrib import messages
from .forms import PortScanForm


# Create your views here.
@login_required
def seo(request):
    """
    用来对获取数据以及返回页面
    """
    if request.method == 'POST':
        url = request.POST['search-query']
        if True:
            g = GetData(url)
            try:  # 尝试取爬取数据
                seo_data_api = g.Get_Seo_api()
                subdomain_data = g.Get_subdomain()
                seo_data_spider = g.Get_seo_spider()
                print(seo_data_spider)
                seo_data_spider_different = seo_data_spider['page_data'][0]["value"]
                print(seo_data_spider_different, type(seo_data_spider_different))
                rtime = {"time": time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))}
                return render(request, "info_collect/seo.html",
                              {"seo_data_api": seo_data_api, "subdomain_data": subdomain_data,
                               "seo_data_spider": seo_data_spider, "rtime": rtime})
            except:
                messages.warning(request, "服务器连接超时获url被屏蔽或url格式不正确，请重新输入！")
                return render(request, "info_collect/seo.html")
    return render(request, "info_collect/seo.html")

@login_required
def security(request):
    if request.method == 'POST':
        url = request.POST['search-query']
        print(url)
        if True:
            g = GetData(url)
            try:  # 尝试取爬取数据
                security_info = g.Get_security_info()
                print(security_info)
                return render(request, "info_collect/security.html", {"security_info": security_info})
            except Exception as e:
                print(e)
                messages.warning(request, "服务器连接超时获url被屏蔽或url格式不正确，请重新输入！")
                return render(request, "info_collect/security.html")
    return render(request, "info_collect/security.html")


def cms(request):
    pass


def seo_charts(request):
    g = GetData()
    seo_data_spider = g.Get_seo_spider()
    print(seo_data_spider['page_data'])
    return JsonResponse(seo_data_spider['page_data'][0])
