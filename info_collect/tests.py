from django.test import TestCase
import requests
import json
import re
import time
import random
from bs4 import BeautifulSoup
# Create your tests here.
# def get_user_agent():
#     user_agent_list = [
#         {'User-Agent': 'Mozilla/4.0 (Mozilla/4.0; MSIE 7.0; Windows NT 5.1; FDM; SV1; .NET CLR 3.0.04506.30)'},
#         {'User-Agent': 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; en) Opera 11.00'},
#         {
#             'User-Agent': 'Mozilla/5.0 (X11; U; Linux i686; de; rv:1.9.0.2) Gecko/2008092313 Ubuntu/8.04 (hardy) Firefox/3.0.2'},
#         {
#             'User-Agent': 'Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.15) Gecko/20101027 Fedora/3.5.15-1.fc12 Firefox/3.5.15'},
#         {
#             'User-Agent': 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.551.0 Safari/534.10'},
#         {'User-Agent': 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.2) Gecko/2008092809 Gentoo Firefox/3.0.2'},
#         {
#             'User-Agent': 'Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/7.0.544.0'},
#         {'User-Agent': 'Opera/9.10 (Windows NT 5.2; U; en)'},
#         {
#             'User-Agent': 'Mozilla/5.0 (iPhone; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko)'},
#         {'User-Agent': 'Opera/9.80 (X11; U; Linux i686; en-US; rv:1.9.2.3) Presto/2.2.15 Version/10.10'},
#         {
#             'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru-RU) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/5.0.2 Safari/533.18.5'},
#         {'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9b3) Gecko/2008020514 Firefox/3.0b3'},
#         {
#             'User-Agent': 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; fr) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16'},
#         {
#             'User-Agent': 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-US) AppleWebKit/534.20 (KHTML, like Gecko) Chrome/11.0.672.2 Safari/534.20'},
#         {
#             'User-Agent': 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; InfoPath.2)'},
#         {'User-Agent': 'Mozilla/4.0 (compatible; MSIE 6.0; X11; Linux x86_64; en) Opera 9.60'},
#         {
#             'User-Agent': 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.366.0 Safari/533.4'},
#         {'User-Agent': 'Mozilla/5.0 (Windows NT 6.0; U; en; rv:1.8.1) Gecko/20061208 Firefox/2.0.0 Opera 9.51'}
#     ]
#     return random.choice(user_agent_list)
#
# url = "https://apistore.aizhan.com/baidurank/siteinfos/c4d431ec91de2de2b74041cdf536c9c8?domains=www.baidu.com"
# a = requests.get(url=url)
# a.encoding = a.apparent_encoding
# a = json.loads(a.text)
#
# print(a['data']['success'][0])
# print(a['data']['success'][0]['domain'])
# print(a['data']['success'][0]['pc_br'])
# print(a['data']['success'][0]['m_br'])
# print(a['data']['success'][0]['ip'])
# print(a['data']['success'][0]['pc_ip'])
# print(a['data']['success'][0]['m_ip'])

# url = "https://baidurank.aizhan.com/baidu/baidu.com/"
# headers = {'User-Agent': get_user_agent()['User-Agent']}
# a = requests.get(url, headers = headers)
# html = a.text
# soup = BeautifulSoup(html, "html.parser")
# dl = soup.findAll('dl', id="dl-sub")[0]
# a = dl.find_all("a")
# print(a[2].text)
# subdomin = []
# for i in a:
#     sub = re.sub(r'[\n\t]', '', i.text)
#     href = i['href']
#     subdomin.append({sub:href})
    # print(i.text)
# print(subdomin)
# print(type(dl), len(dl))
# print(dl[0].find_all('a'))
# url = "https://www.aizhan.com/cha/baidu.com/"
# url = "https://baidurank.aizhan.com/baidu/baidu.com/"
# headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36'}
# data = requests.get(url=url)
# print(data)
# with open("a.txt", "a") as f:
#     f.write(data.text)
# print(data.text)
# data.encoding = data.apparent_encoding
# html = data.text
# print(html)
# soup = BeautifulSoup(html, "html.parser")
# div = soup.find_all("div", {"class":"content"})
# print(div)

a = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
print(a, type(a))