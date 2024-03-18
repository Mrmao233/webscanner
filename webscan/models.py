from django.db import models


# Create your models here.


class CWE_INFO(models.Model):
    cwe_ranking = models.PositiveIntegerField()  # 排名
    cwe_id = models.CharField(max_length=50)  # 漏洞序号
    cwe_name = models.CharField(max_length=255)  # 名称
    cwe_score = models.DecimalField(max_digits=5, decimal_places=2)  # 分数
    cwe_comparison = models.DecimalField(max_digits=5, decimal_places=2)  # 对比

    def __str__(self):
        return f"{self.cwe_ranking}/{self.cwe_id}/{self.cwe_name}"


class Article_info(models.Model):
    article_href = models.CharField(max_length=100)
    article_id = models.IntegerField(unique=True)
    title = models.CharField(max_length=200)
    description = models.TextField()
    image_url = models.URLField()
    author_name = models.CharField(max_length=100)
    author_image_url = models.URLField()
    date = models.DateField()


    def __str__(self):
        return self.title
"""
                'href': href,
                'article_id': article_id,
                'title': title,
                'original_text': original_text,
                'author_img': author_img,
                'author_name': author_name,
                'time': time,
                'articl_img' : articl_img

"""