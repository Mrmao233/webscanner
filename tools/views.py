"""
===============
@author:maverick0407
@time:2023/4/03
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
import random, requests
from .models import tools, ctf_webs
from bs4 import BeautifulSoup


# Create your views here.
@login_required
def commonly_used(request):
    """
    小工具
    """
    tool = tools.objects.all()
    print(tool)
    return render(request, "tools/commonly_used.html", {"tool": tool})

@login_required
def ctf_web(request):
    """
    常用ctf网站
    """
    ctf = ctf_webs.objects.all()
    return render(request, "tools/ctf_webs.html", {"ctf": ctf})
