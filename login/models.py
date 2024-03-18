"""
===============
@author:maverick0407
@time:2023/3/21:17:26
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=50)#用户名
    password = models.CharField(max_length=128)#密码
    id = models.AutoField(primary_key=True)#ID