# Generated by Django 4.2 on 2023-04-23 09:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webscan', '0005_article'),
    ]

    operations = [
        migrations.CreateModel(
            name='Article_info',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('article_href', models.CharField(max_length=100)),
                ('article_id', models.IntegerField(unique=True)),
                ('title', models.CharField(max_length=200)),
                ('description', models.TextField()),
                ('image_url', models.URLField()),
                ('author_name', models.CharField(max_length=100)),
                ('author_image_url', models.URLField()),
                ('date', models.DateField()),
            ],
        ),
        migrations.DeleteModel(
            name='Article',
        ),
    ]
