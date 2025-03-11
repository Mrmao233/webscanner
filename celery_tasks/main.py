"""
===============
@author:maverick0407
@time:2023/4/03
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
import django
from celery import Celery
import os

# 读取Django的配置

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'webscanner.settings')

# 创建celery对象，并指定配置
app = Celery("webscanner")

# celery项目配置：worker代理人以及存放位置等配置信息，指定任务存储到哪里
app.config_from_object('celery_tasks.config')

# 使用 gevent 作为并发库
app.conf.worker_pool = 'gevent'

# 任务位置
app.autodiscover_tasks([
    "celery_tasks.portscan",
    "celery_tasks.dirscan",
    "celery_tasks.security_news",
])

'''启动命令：

celery:  celery -A celery_tasks.main worker -l info -P gevent

redis:   redis-server.exe redis.windows.conf
'''
