"""
===============
@author:maverick0407
@time:2023/4/21:17:26
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django.db import models

# Create your models here.


class ScanResult(models.Model):
    target_url = models.URLField()
    target_id = models.CharField(max_length=50)
    scan_id = models.CharField(max_length=50)
    low_vulns = models.PositiveIntegerField(default=0)
    info_vulns = models.PositiveIntegerField(default=0)
    medium_vulns = models.PositiveIntegerField(default=0)
    high_vulns = models.PositiveIntegerField(default=0)
    total_vulns = models.PositiveIntegerField(default=0)
    created_time = models.DateTimeField(auto_now_add=True)
    task_status = models.CharField(max_length=50)
    scan_mode = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.target_url}/{self.target_id}/{self.scan_id}"