"""
===============
@author:maverick0407
@time:2023/4/03
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
# 代理人，指定redis作为消息队列
broker_url = "redis://127.0.0.1:6379/9"
# 任务运行结果保存位置
result_backend = "redis://127.0.0.1:6379/10"
