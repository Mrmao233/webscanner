"""
===============
@author:maverick0407
@time:2023/4/12
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
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

    def Get_Seo_api(self):
        """
        通过api获取网站seo权重数据
        """
        url = "https://apistore.aizhan.com/baidurank/siteinfos/c4d431ec91de2de2b74041cdf536c9c8?domains="+self.host
        data = requests.get(url=url)
        data.encoding = data.apparent_encoding
        data = json.loads(data.text)
        return data['data']['success'][0]

    def Get_subdomain(self):
        """
        通过爬虫获取目标网站子域名
        """
        url = "https://baidurank.aizhan.com/baidu/"+self.host
        headers = {'User-Agent': self.get_user_agent()['User-Agent']}
        a = requests.get(url, headers=headers)
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
        headers = {'User-Agent': self.get_user_agent()['User-Agent']}
        a = requests.get(url, headers=headers)
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
        return final_data

    def Get_security_info(self):
        """
        通过爬虫获取目标网站的网站安全数据
        """
        url = "https://tools.aizhan.com/webscan/"+self.host+"/"
        headers = {'User-Agent': self.get_user_agent()['User-Agent']}
        r = requests.get(url, headers=headers)
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
        # print(data)
        return data

g = GetData("www.baidu.com")
g.Get_security_info()

