"""
===============
@author:maverick0407
@time:2023/4/03
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.db import models

# Create your models here.

class tools(models.Model):
    url = models.URLField()
    name = models.CharField(max_length=100)
    img_src = models.URLField()
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class ctf_webs(models.Model):
    url = models.URLField()
    name = models.CharField(max_length=100)
    img_src = models.URLField()
    title = models.CharField(max_length=100)
    def __str__(self):
        return self.name