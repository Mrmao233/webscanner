"""
===============
@author:maverick0407
@time:2023/4/10:17:26
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
import json
import time
from datetime import datetime
import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
from webscanner.settings import AWVS_API_KEY
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)


class awvs:
    def __init__(self):
        self.base_url = "https://localhost:3443"
        self.api_key = AWVS_API_KEY
        self.headers = {"X-Auth": self.api_key, "Content-type": "application/json;charset=utf8"}

    def add_target(self, target_url):
        """
        添加目标,并返回目标id,target_url为目标的url
        """
        api_url = self.base_url + '/api/v1/targets'  #
        data = {
            "address": target_url,
            "description": "maverick0407_test",
            "criticality": "10"
        }
        data_json = json.dumps(data)
        r = requests.post(url=api_url, headers=self.headers, data=data_json, verify=False)  # 添加目标要用post方法，获取目标用get方法
        target_id = r.json().get("target_id")
        print('target_id:', target_id)
        return target_id

    def check_target_id(self):
        """
        查看所有目标的目标id
        """
        api_url = self.base_url + '/api/v1/targets'
        r = requests.get(url=api_url, headers=self.headers, verify=False)
        # for i in r.json()['targets']:
        #     print(i)
        return r.json()

    def add_scan(self, target_id, scan_option):
        """
        添加扫描对象,并返回对象id，target_id为要开始扫描的任务id
        """
        api_url = self.base_url + '/api/v1/scans'
        data = {
            "target_id": target_id,
            "profile_id": "11111111-1111-1111-1111-1111111111" + scan_option,  # 最后两个数字为扫描方式
            "schedule":
                {"disable": False,
                 "start_date": None,
                 "time_sensitive": False
                 }
        }
        data_json = json.dumps(data)
        r = requests.post(url=api_url, headers=self.headers, data=data_json, verify=False)  # 还是一样的，添加任务用post，查看id用get
        print(r.json())
        print("target_id:", r.json().get("target_id"))
        return r.json().get("target_id")

    def check_scan_id(self):
        """
        查看所有扫描任务的任务id
        """
        api_url = self.base_url + '/api/v1/scans'
        r = requests.get(url=api_url, headers=self.headers, verify=False)
        try:
            scan_id = r.json()  # .get("scans")[0].get("scan_id")
            # print('scan_id:', scan_id)
            return scan_id
        except:
            print("没有任务正在扫描中！")
            return None

    def check_scan_stats(self):
        """
        获取当前扫描的状态和进度等
        """
        api_url = self.base_url + '/api/v1/me/stats'
        r = requests.get(url=api_url, headers=self.headers, verify=False)
        try:
            result = r.json()
            # print(result)
            return result
        except:
            return None

    def check_scan_results(self):
        """
        查看结果
        """
        api_url = self.base_url + '/api/v1/vulnerabilities/3082201828545266889'
        r = requests.get(url=api_url, headers=self.headers, verify=False)
        print(r.json())
        # for i in r.json()["vulnerabilities"]:
        #     print(i)
        # print(len(r.json()["vulnerabilities"]))

    def check_process(self, scan_id):
        """
        查看当前扫描任务的进程
        """
        url = self.base_url + '/api/v1/scans/' + scan_id
        # print(url)
        r = requests.get(url=url, headers=self.headers, verify=False)
        return r.json()

    def vulnerabilities_info(self, scan_id, scan_session_id):
        """
        获取单个扫描对象的详细信息，需要传递参数为扫描对象中的scan_id和scan_session_id
        """
        url = self.base_url + '/api/v1/scans/' + scan_id + '/results/' + scan_session_id + '/vulnerabilities'
        # print(url)
        r = requests.get(url=url, headers=self.headers, verify=False)
        return r.json()

    def vulnerabilities_detail_info(self, scan_id, scan_session_id, vuln_id):
        """
        获取单个扫描对象的详细信息，需要传递参数为扫描对象中的scan_id和scan_session_id和当前扫描的漏洞vuln_id
        """
        url = self.base_url + '/api/v1/scans/' + scan_id + '/results/' + scan_session_id + '/vulnerabilities/' + vuln_id
        # print(url)
        r = requests.get(url=url, headers=self.headers, verify=False)
        return r.json()

    def scan_info(self, scan_id, scan_session_id):
        """
        获取当前扫描的一些信息
        """
        # print(scan_id, scan_session_id)
        url = self.base_url + '/api/v1/scans/' + scan_id + '/results/' + scan_session_id + '/statistics'
        # print(url)
        r = requests.get(url=url, headers=self.headers, verify=False)
        return r.json()

    def generate_report(self, scan_id, report_option):
        """
        生成扫描报告
        """
        url = self.base_url + '/api/v1/reports'
        data = {"template_id": "11111111-1111-1111-1111-1111111111" + report_option,
                "source": {
                    "list_type": "scans",
                    "id_list": [scan_id]
                }
                }
        data = json.dumps(data)
        # print(data)
        r = requests.post(url=url, data=data, headers=self.headers, verify=False)
        return r
    def get_report(self):
        """
        下载扫描报告
        """
        url = self.base_url + '/api/v1/reports'
        r = requests.get(url=url, headers=self.headers, verify=False)
        return r.json()

if __name__ == '__main__':
    awvs = awvs()
    # print(awvs.scan_info()['max_network_scan_time'])
    # target_id = awvs.add_target("www.baidu.com")
    # t = awvs.check_target_id()['targets'][0]['target_id']
    # print(target_id)
    # print("target_id:", t)
    # # print(t['targets'][0]['target_id'])
    # st = awvs.add_scan(t)
    # print(st)
    # awvs.check_scan_stats()
    # st = awvs.check_scan_id()
    # print(st)
    # for s in st['scans']:
    #     print(s['scan_id'])
    # print(awvs.generate_report('3b61b651-a382-44da-ae02-098790fd73fd', '19'))
    # print(awvs.get_report()['reports'][0]['download'])
    # for re in awvs.generate_report(111)['reports']:
    #     print(re)
    # print(awvs.generate_report(s['scan_id']))
    #     print(awvs.scan_info(s['scan_id'], s['current_session']['scan_session_id']))
    # print(awvs.generate_report())
    #     print(awvs.check_process(s['scan_id']))
    # print('scan_id:',s['scan_id'], "scan_session_id:",s['current_session']['scan_session_id'], )
    # vul = awvs.vulnerabilities_info(s['scan_id'], s['current_session']['scan_session_id'])['vulnerabilities']
    # for v in vul:
    #     print(v)

    # print(awvs.check_process(s['scan_id']))
    # print(st)
    # print(awvs.check_process(st))
    # re = awvs.check_scan_stats()
    # print(re)
    # url = "https://localhost:3443/api/v1/scans/"+st
    # print(url)
    # a = requests.get(url = url, headers=awvs.headers, verify=False)
    # print(a.json())
    # awvs.check_scan_results()
    # while True:
    #     awvs.check_scan_stats()
    #     time.sleep(5)
