# Generated by Django 4.2 on 2023-04-17 07:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vulscan', '0005_remove_scanresult_scan_mode'),
    ]

    operations = [
        migrations.AddField(
            model_name='scanresult',
            name='scan_mode',
            field=models.CharField(default='', max_length=10),
        ),
    ]
