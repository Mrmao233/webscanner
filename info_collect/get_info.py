"""
===============
@author:maverick0407
@time:2023/4/12
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
import time

import requests
import json
import random
from bs4 import BeautifulSoup
import re
"""
获取数据

"""

class GetData:
    def __init__(self, host="www.baidu.com"):
        self.host = host

    def get_user_agent(self):
        user_agent_list = [
            # Chrome (Windows)
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
            # Chrome (Mac)
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
            # Firefox (Windows)
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0",
            # Firefox (Mac)
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/115.0",
            # Safari (Mac)
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Safari/605.1.15",
            # Edge (Windows)
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.58",
            # Edge (Mac)
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.58",
        ]
        return {"User-Agent": random.choice(user_agent_list)}


    def Get_Seo_api(self):
        """
        通过api获取网站seo权重数据
        """
        url = "https://apistore.aizhan.com/baidurank/siteinfos/c4d431ec91de2de2b74041cdf536c9c8?domains="+self.host
        data = requests.get(url=url, headers=self.get_user_agent())
        data.close()
        data.encoding = data.apparent_encoding
        data = json.loads(data.text)
        # print(data)
        return data['data']['success'][0]

    def Get_subdomain(self):
        """
        通过爬虫获取目标网站子域名
        """
        url = "https://baidurank.aizhan.com/baidu/"+self.host
        a = requests.get(url, headers=self.get_user_agent())
        a.close()
        html = a.text
        soup = BeautifulSoup(html, "html.parser")
        dl = soup.findAll('dl', id="dl-sub")[0]
        a = dl.find_all("a")
        subdomin = []
        for i in a[1:]:
            sub = re.sub(r'[\n\t]', '', i.text)
            href = i['href']
            subdomin.append({"domain":sub, "href": href})

        return subdomin

    def Get_seo_spider(self):
        """
        通过爬虫获取目标网站的其他seo数据
        """
        url = "https://www.aizhan.com/cha/"+self.host
        a = requests.get(url, headers=self.get_user_agent())
        html = a.text
        soup = BeautifulSoup(html, "html.parser")
        div = soup.find_all("div", {"class": "content"})
        Page_Strength = []
        Com_info_dict = {}
        Com_info = []
        title = []
        age = []
        final_data = {}
        for li in div[0].find_all("tr")[1].find_all("li"):
            Page_Strength.append({"source":li.text, "value":li.find("img")['alt']})
            final_data["page_data"] = Page_Strength
        list = ["com_code", "property", "name", "time"]
        i = 0
        for li in div[0].find_all("tr")[3].find_all("li"):
            Com_info_dict[list[i]] = re.search(r'(?<=：).*', li.text).group(0)
            i+=1
        Com_info.append(Com_info_dict)
        final_data["com_data"] = Com_info
        title.append({"title": soup.find("div", {"id": "webpage_title"}).text})
        final_data["title_data"] = title
        age.append({"age": re.search(r'(?<=：).*', soup.find("li", {"id": "whois_created"}).text).group(0)})
        final_data["age_data"] = age
        a.close()
        return final_data

    def Get_security_info(self):
        """
        通过爬虫获取目标网站的网站安全数据
        """
        url = "https://tools.aizhan.com/webscan/"+self.host+"/"
        r = requests.get(url, headers=self.get_user_agent())
        html = r.text
        soup = BeautifulSoup(html, "html.parser")
        td = soup.find_all("td", {"class":"check-result ng-scope"})
        div = soup.find_all("div", {"class":"right"})[0]
        ptag = div.find_all("p")
        qax_info = soup.find_all("dd", {"class":"ico-safe-sm l4"}) #奇安信数据

        num=0
        info_1 = {}
        info_2 = {}
        info_3 = {}
        data = []
        for t in td:
            info_1[num] = re.sub(r'[\n\t]', '', t.text)
            num+=1
        num = 0
        for p in ptag:
            info_2[num] = re.sub(r'[\n\t]', '', p.text)
            num+=1
        num = 0
        for q in qax_info:
            info_3[num] = re.sub(r'[\n\t]', '', q.text)
            num+=1
        data.append(info_1)
        data.append(info_2)
        data.append(info_3)
        r.close()
        return data

if __name__=="__main__":
    g = GetData("www.bilibili.com")
    g.Get_seo_spider()
    # g.Get_security_info()
    g.Get_subdomain()
    g.Get_Seo_api()


