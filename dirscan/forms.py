"""
===============
@author:maverick0407
@time:2023/4/10
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""
from django import forms
from django.core.validators import URLValidator
from django.core.exceptions import ValidationError


class PortScanForm(forms.Form):
    url_input = forms.CharField(label='URL', max_length=100, validators=[URLValidator()])

    def clean_url(self):  # 对用户输入的url进行验证和清洗
        url = self.cleaned_data['url']
        if 'http' or 'www' not in url:
            raise ValidationError('URL必须以http或https开头')
        return url
