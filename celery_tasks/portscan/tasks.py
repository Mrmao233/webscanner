"""
===============
@author:maverick0407
@time:2023/4/03
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from celery_tasks.main import app
import time
import socket
import threading
from portscan.models import ScanResult, Port
import concurrent.futures
import socket
import socket
import threading

class PortScanner:
    def __init__(self, host,ports_per_thread=140):
        """
        初始化函数，设置要扫描的目标主机和每个线程内允许扫描的端口数量。我的奠奈最多就是140，65535个端口就开差不多500个线程，多了就要报错了
        参数:
            host (str): 要扫描的目标主机的IP地址或主机名。
            ports_per_thread (int, optional): 每个线程内允许扫描的端口数量。默认为140。
        """
        self.i = 0
        self.host = host
        self.open_ports = []
        self.ports_per_thread = ports_per_thread

    def scan(self, start_port=0, end_port=65535):
        """
        扫描目标主机的指定端口范围，输出开放的端口列表。
        参数:
            start_port (int, optional): 扫描的起始端口号。默认为0。
            end_port (int, optional): 扫描的结束端口号。默认为65535。
        """
        # 将端口号划分为若干组，每组包含指定数量的端口号
        port_groups = [list(range(start_port + i, min(start_port + i + self.ports_per_thread, end_port + 1)))
                       for i in range(0, end_port - start_port + 1, self.ports_per_thread)]
        threads = []
        # 对于每组端口号，启动一个线程进行扫描
        for ports in port_groups:

            thread = threading.Thread(target=self._scan_ports, args=(ports,))
            threads.append(thread)
            thread.start()

        # 等待所有线程扫描结束
        for thread in threads:
            thread.join()

    def _scan_ports(self, ports):
        """
        扫描指定的一组端口号，将开放的端口号添加到self.open_ports列表中。
        参数:
            ports (list[int]): 需要扫描的端口号列表。
        """
        for port in ports:
            sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sk.settimeout(1)
            try:
                sk.connect((self.host, port))
                print("Connected to port " + str(port) + " successfully!  " + str((++self.i)/65535) + "%")
                #如果端口开放，就存入数据库，并且存入之前要先检查数据库中是否有相同数据，如果有，就不存了
                existing_results = ScanResult.objects.filter(url=self.host, port=port)
                if existing_results:
                    pass
                else:
                    result = ScanResult(url=self.host, port=port)
                    result.save()
                self.open_ports.append(port)
            except Exception:
                print("Connected to port " + str(port) + " failed!  " + str((++self.i)/65535) + "%")
                pass


@app.task
def scan_port(host):
    scanner = PortScanner(host)
    start = time.time()
    print("start ")
    scanner.scan(start_port=0, end_port=65535)
    print("OPEN_PORTS:", scanner.open_ports)
    print("ends, it takes %s " % (time.time()-start))
    return scanner.open_ports


# @app.task
# def scan_port(target_ip):
#     start = time.time()
#     print("start ")
#     scanner = PortScanner(target_ip)
#     scanner.scan()
#     print("THIS",scanner.open_ports)
#     print("ends, it takes %s " %(time.time()-start))
#多线程版本，但是线程开太多了资源耗尽会报错
# class PortScanner:
#     def __init__(self, host):
#         self.host = host
#         self.open_ports = []
#
#     def scan(self, start_port=0, end_port=65535):
#         threads = []
#         for port in range(start_port, end_port + 1):
#             thread = threading.Thread(target=self._socket_connect, args=(self.host, port))
#             threads.append(thread)
#             thread.start()
#
#         for thread in threads:
#             thread.join()
#
#     def _socket_connect(self, host, port):
#         sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#         sk.settimeout(1)
#         try:
#             sk.connect((host, port))
#             print("Connected to port " + str(port) + " successfully!")
#             ScanResult.objects.create(url=host, port=port)
#             self.open_ports.append(port)
#         except Exception:
#             print("Connected to port " + str(port) + " Faild!")
#             pass



#单线程版本----------太慢了，所以注释掉
# class PortScanner:
#     def __init__(self, target_ip):
#         self.target_ip = target_ip
#         self.open_ports = []
#         self.low = 20
#         self.high = 26
#     def get_total_ports(self):
#         return self.high - self.low
#     def scan(self):
#         for port in range(self.low, self.high):
#             sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#             sock.settimeout(1)
#             try:
#                 sock.connect((self.target_ip, port))
#                 print("connect", port)
#                 self.open_ports.append(port)
#                 existing_results = ScanResult.objects.filter(url=self.target_ip, port=port)
#                 if existing_results:
#                     pass
#                 else:
#                     result = ScanResult(url=self.target_ip, port=port)
#                     result.save()
#
#             except:
#                 print("error connect", port)
#             finally:
#                 sock.close()
