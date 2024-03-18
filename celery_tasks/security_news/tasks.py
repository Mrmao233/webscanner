"""
===============
@author:maverick0407
@time:2023/4/23:17:06
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""

import requests
from bs4 import BeautifulSoup
from celery_tasks.main import app
from webscan.models import Article_info


class securitynews:
    def __init__(self):
        self.url = "https://www.freebuf.com/vuls"

    def news(self):
        r = requests.get(url=self.url)
        soup = BeautifulSoup(r.text, "html.parser")
        div = soup.find_all("div", {"class": "article-item"})
        # 遍历所有class="article-item"的标签
        c = 0
        results = []
        for item in div:
            # 1. 提取第一个a标签的href地址以及这个地址最后的那一串数字
            a_tags = item.find_all('a')
            href = 'https://www.freebuf.com' + a_tags[0].get('href')
            article_id = href.split('/')[-1].split('.')[0]

            # 2. 提取a标签里面的span标签内的文字内容
            title = a_tags[0].find('span', {'class': 'title'}).text.strip()

            # 3. 提取下面另一个a标签中的文字内容，这里就是"原创"这两个字
            try:
                original_text = item.find("span", {"class": "tag-view ant-tag ant-tag-orange"})[0].text.replace('\n',
                                                                                                                '').strip()
            # print(original_text)
            except:
                original_text = ''

            # 4. 提取文章图片地址
            author_img = item.find_all('img')[1].get('src')

            # 5. 提取中部div元素
            div_bottom = item.find_all("div", {"class": "item-bottom"})

            # 5. 提取在这个片段里是这段文字"lbug"的这部分文字内容
            author_name = div_bottom[0].find_all('span')[1].text

            # 6. 提取文章发布时间
            time = div_bottom[0].find_all('span')[-1].text

            # 7.获取图片地址
            articl_img = "https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg"

            # 8. 提取文章简介
            description = item.find("a", {"class": "text text-line-2"}).text.replace('\n', '').strip()

            # 9.存入数据库
            existing_results = Article_info.objects.filter(article_id=article_id)
            if existing_results:
                print("exist data")
            else:
                article = Article_info(article_id=article_id, article_href=href, title=title, description=description,
                                       image_url=articl_img, author_name=author_name, author_image_url=author_img,
                                       date=time)
                article.save()
                print("success")


@app.task
def news():
    new = securitynews()
    n = new.news()
