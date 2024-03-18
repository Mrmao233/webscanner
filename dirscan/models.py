"""
===============
@author:maverick0407
@time:2023/4/10
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.db import models

# Create your models here.

class ScanResult(models.Model):
    target_url = models.URLField(max_length=255)
    scan_path = models.CharField(max_length=255)
    response_code = models.PositiveSmallIntegerField()
    access_status = models.CharField(max_length=20)
    scan_time = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return f"{self.target_url}/{self.scan_path}/{self.access_status}"
