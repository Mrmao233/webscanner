# Generated by Django 4.2 on 2023-04-16 15:21

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ScanResult',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('target_url', models.URLField()),
                ('target_id', models.CharField(max_length=50)),
                ('scan_id', models.CharField(max_length=50)),
                ('low_vulns', models.PositiveIntegerField(default=0)),
                ('medium_vulns', models.PositiveIntegerField(default=0)),
                ('high_vulns', models.PositiveIntegerField(default=0)),
                ('total_vulns', models.PositiveIntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('task_status', models.CharField(max_length=50)),
            ],
        ),
    ]