# Generated by Django 4.2 on 2023-04-17 08:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vulscan', '0011_rename_created_at_scanresult_created_time'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scanresult',
            name='scan_mode',
            field=models.CharField(max_length=20),
        ),
    ]
