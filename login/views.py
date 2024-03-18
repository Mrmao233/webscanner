"""
===============
@author:maverick0407
@time:2023/3/21:17:26
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.contrib.auth import authenticate, login
from django.shortcuts import render
from django.contrib.auth.models import User
from django.shortcuts import redirect
from django.urls import reverse
from django.contrib import messages
from django.http import HttpResponseBadRequest
import uuid
# Create your views here.
def Login(request):
    try:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')
            print(username, password)
            user = authenticate(request, username=username, password=password)
            if user is not None:
                # messages.success(request, "登陆成功，欢迎您：", user)
                login(request, user)
                return redirect(reverse("webscan"))
            else:
                messages.error(request, "用户名或密码错误，登陆失败！")
                return redirect(request, "login/login.html")
    except Exception as e:
        print(e)
        # messages.error(request, "用户名或密码错误，登陆失败！")
        return render(request, "login/login.html")
    return render(request, "login/login.html")


def register(request):
    try:
        #获取账户密码信息
        if request.method == "POST":
            username = request.POST['register_username']
            password = request.POST['register_password']
            try:
                user = User.objects.create_user(username=username, password=password)#保存用户数据到数据库
                user.save()
                messages.success(request, "注册成功！请使用新账号登陆。")#将提示信息返回到前端
                print("成功添加用户：", username)#debug信息
                return redirect(reverse('login'))#如果注册成功则重定向到登陆界面
            except:
                messages.error(request, "用户名已存在或出现其他错误！请重新输入！")#如果出现错误则提示错误信息，并且返回到前端
                print(messages)
                return render(request, "login/login.html")#注册失败就到当前界面重新注册
    except Exception as e:
        print(e)
        return HttpResponseBadRequest("无效请求！")#预防其他错误信息

    return render(request, "login/login.html")