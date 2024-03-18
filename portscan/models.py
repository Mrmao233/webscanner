"""
===============
@author:maverick0407
@time:2023/4/9
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""

from django.db import models


# Create your models here.
class Port(models.Model):
    port_number = models.PositiveIntegerField(unique=True)  # 端口号
    service = models.CharField(max_length=100)  # 服务
    protocol = models.CharField(max_length=10)  # 协议

    def __str__(self):
        return f"{self.port_number}/{self.service}/{self.protocol}"


class ScanResult(models.Model):
    url = models.CharField(max_length=200)  # 目标url
    port = models.IntegerField()  # 端口
    scan_time = models.DateTimeField(auto_now_add=True)  # 扫描时间

    def __str__(self):
        return f"{self.url}/{self.port}/{self.scan_time}"
