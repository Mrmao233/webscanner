"""

portscan端口扫描功能判断用户舒服是否合法的类

by:xhwdm 2023。04。09
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
