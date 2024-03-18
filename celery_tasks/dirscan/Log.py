"""
===============
@author:maverick0407
@time:2023/4/11
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""

import logging


def set_log(msg, file_name='log.txt'):
    logging.basicConfig(
        filename=file_name,
        level=logging.INFO,
        format='%(asctime)s %(filename)s[line:%(lineno)d] %(message)s',
        datefmt='%Y-%m-%d %X'
    )
    logging.info(msg)
