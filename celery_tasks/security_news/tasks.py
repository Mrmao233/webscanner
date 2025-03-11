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
        r = requests.get(url=self.url, timeout=10)
        soup = BeautifulSoup(r.text, "html.parser")
        div = soup.find_all("div", {"class": "article-item"})
        # 遍历所有class="article-item"的标签
        c = 0
        results = []
        for item in div:
            # 1. 提取文章地址以及文章ID
            a_tags = item.find_all('a')
            href = 'https://www.freebuf.com' + a_tags[0].get('href')
            article_id = href.split('/')[-1].split('.')[0]

            # 2. 提取标题
            title = a_tags[0].find('span', {'class': 'title'}).text.strip()

            # 3. 提取文章类型
            try:
                original_text = item.find("span", {"class": "tag-view ant-tag ant-tag-orange"})[0].text.replace('\n', '').strip()
            except:
                original_text = ''
            # print(original_text)

            # 4. 提取作者头像地址
            try:
                author_img = item.find_all('img')[1].get('src')
                if author_img is None:
                    author_img = "https://image.3001.net/images/index/wp-user-avatar-50x50.png"
            except:
                author_img = "https://image.3001.net/images/index/wp-user-avatar-50x50.png"

            # 5. 提取bottem div元素
            div_bottom = item.find_all("div", {"class": "item-bottom"})

            # 6. 提取在这个片段里是这段文字"lbug"的这部分文字内容
            author_name = div_bottom[0].find_all('span')[1].text

            # 7. 提取文章发布时间
            time = div_bottom[0].find_all('span')[-1].text

            # 8.获取图片地址
            articl_img = "https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg"

            # 9. 提取文章简介
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

if __name__ == "__main__":
    news = securitynews()
    news.news()
