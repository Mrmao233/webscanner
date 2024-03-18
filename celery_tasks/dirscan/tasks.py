"""
===============
@author:maverick0407
@time:2023/4/11
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from celery_tasks.main import app
import queue
import requests
import threading
import random
import re
import multiprocessing
from .Log import set_log
import sys
import os
from dirscan.models import ScanResult


class DirScan:
    scan_host_name = ''
    scan_code = [200, 300, 404, 500]
    queues = object
    limit = 8
    ip_list = {}

    def __init__(self, host_name='http://www.baidu.com',
                 file_path='E://Vulnerability scanner/webscanner/celery_tasks/dirscan/dictionary/'):
        self.scan_host_name = host_name
        self.queues = queue.Queue()
        self.get_all_file(file_path=file_path)
        self.get_ip()

    # 获取目录下面所有的文件名称
    def get_all_file(self, file_path):
        # print(file_path)
        file_list = [file_path + file for file in os.listdir(file_path)]

        self.file_list = file_list
        return file_list

    # 把所有key放入到队列里面
    def get_all_scan_key(self):
        for key in self.file_list:
            fd = open(key, "r", encoding='UTF-8')
            print(key)
            while 1:
                buffer = fd.read(1024)
                if not buffer:
                    break
                result = buffer.split('\n')
                for res in result:
                    self.queues.put(res)
        return

    # 多进程扫描
    def scan_dir_helps(self):
        print("开始创建扫描线程")
        self.get_all_scan_key()  # 获取所有要扫描的目录
        threads = []
        for i in range(self.limit):  #  根据设定的线程数循环创建线程
            threads.append(threading.Thread(target=self.scan_dir_worker)) #  将创建的线程添加到线程列表
        for t in threads:
            t.start()  # 启动所有的线程
        for t in threads:
            t.join()  # 等待所有线程执行完毕

    # 扫描线程函数
    def scan_dir_worker(self):
        while True:
            try:
                key = self.queues.get(timeout=1)
            except queue.Empty:
                break
            self.scan_dir(key)

    # 扫描
    def scan_dir(self, key):
        if 'http://' or 'https://' not in self.scan_host_name:
            host_addr = f"http://{self.scan_host_name}/{key}"
        else:
            host_addr = f"{self.scan_host_name}/{key}"

        try:
            r = requests.get(url=host_addr, headers=self.get_user_agent())
            r.encoding = r.apparent_encoding
            r.encoding = r.apparent_encoding
            # 避免碰到假页面
            if "您访问的页面不存在!" or "404" in r.text:
                r.status_code = 404
                # print(r.text)
            if r.status_code in self.scan_code:
                # 存数据库
                existing_results = ScanResult.objects.filter(target_url=self.scan_host_name, scan_path=host_addr)
                if existing_results:
                    pass
                else:
                    if r.status_code == 200:
                        access_status = "成功"
                    elif r.status_code == 300:
                        access_status = "网站跳转"
                    elif r.status_code == 404:
                        access_status = "未找到网页"
                    elif r.status_code == 500:
                        access_status = "服务器请求失败"
                    else:
                        access_status = "未知"
                    # 把不是404的页面存入数据库
                    if r.status_code != 404:
                        result = ScanResult(target_url=self.scan_host_name, scan_path=host_addr,
                                            response_code=r.status_code, access_status=access_status)
                        result.save()
                # 写日志
                msg = {host_addr: r.status_code}
                file_name = self.scan_host_name.replace('http://', '')
                file_name = file_name.replace('https://', '')
                set_log(msg, file_name)
                # print(msg)
                return msg

        except Exception as e:
            print(host_addr, "无法访问")

    @staticmethod
    def get_user_agent():
        user_agent_list = [
            {'User-Agent': 'Mozilla/4.0 (Mozilla/4.0; MSIE 7.0; Windows NT 5.1; FDM; SV1; .NET CLR 3.0.04506.30)'},
            {'User-Agent': 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; en) Opera 11.00'},
            {
                'User-Agent': 'Mozilla/5.0 (X11; U; Linux i686; de; rv:1.9.0.2) Gecko/2008092313 Ubuntu/8.04 (hardy) Firefox/3.0.2'},
            {
                'User-Agent': 'Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.15) Gecko/20101027 Fedora/3.5.15-1.fc12 Firefox/3.5.15'},
            {
                'User-Agent': 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.551.0 Safari/534.10'},
            {'User-Agent': 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.2) Gecko/2008092809 Gentoo Firefox/3.0.2'},
            {
                'User-Agent': 'Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/7.0.544.0'},
            {'User-Agent': 'Opera/9.10 (Windows NT 5.2; U; en)'},
            {
                'User-Agent': 'Mozilla/5.0 (iPhone; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko)'},
            {'User-Agent': 'Opera/9.80 (X11; U; Linux i686; en-US; rv:1.9.2.3) Presto/2.2.15 Version/10.10'},
            {
                'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru-RU) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/5.0.2 Safari/533.18.5'},
            {'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9b3) Gecko/2008020514 Firefox/3.0b3'},
            {
                'User-Agent': 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; fr) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16'},
            {
                'User-Agent': 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-US) AppleWebKit/534.20 (KHTML, like Gecko) Chrome/11.0.672.2 Safari/534.20'},
            {
                'User-Agent': 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; InfoPath.2)'},
            {'User-Agent': 'Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.60'},
            {
                'User-Agent': 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.366.0 Safari/533.4'},
            {'User-Agent': 'Mozilla/5.0 (Windows NT 6.0; U; en; rv:1.8.1) Gecko/20061208 Firefox/2.0.0 Opera 9.51'}
        ]
        return random.choice(user_agent_list)

    # 代理ip
    def get_ip(self):
        urls = "https://www.kuaidaili.com/free/inha/1/"
        headers = {'User-Agent': self.get_user_agent()['User-Agent'], 'Content-Type': 'application/json',
                   'method': 'GET', 'Accept': 'application/vnd.github.cloak-preview'}
        try:
            str_html = requests.get(urls, headers=headers, verify=False)
        except Exception as e:
            return "代理服务器连接失败，请稍后再试！！"
        str_text = str_html.text
        regex = re.compile('<td data-title="IP">(.*)</td>')
        ips = regex.findall(str_text)
        port_regex = re.compile('<td data-title="PORT">(.*)</td>')
        ports = port_regex.findall(str_text)
        ip_arr = {ips[key]: ports[key] for key in range(len(ips))}

        self.ip_list = ip_arr
        return self.ip_list


@app.task
def scan_dir(host_name="www.baidu.com"):
    dirScan = DirScan(host_name=host_name)
    dirScan.scan_dir_helps()
