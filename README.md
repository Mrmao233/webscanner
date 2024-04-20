## 基于Django+Celery+AWVS的漏洞扫描器WEBSCANNER

如果觉得本项目对你有帮助的话，请点一个❤️支持一下吧,不胜感激🙇🙇🙇

## 项目简介

1.此扫描器基于Python3.8.0和Django2.2开发，是一款全开源的漏洞扫描器，借助Celery插件实现了异步的端口扫描和后台扫描，而漏洞扫描则使用了著名漏洞扫描工具AWVS的API实现。

2.本项目的前端界面在开源项目H+的基础上开发，项目功能开发思路参考[Sec-tools](https://gitee.com/jwt1399/Sec-Tools.git)

3.Github地址：[webscanner](https://github.com/Mrmao233/webscanner.git)



## 项目前置工作

1.项目克隆

`git clone https://gitee.com/maverick0407/webscanner.git`

2.激活虚拟环境

`venv\Scripts\activate`

3.安装项目依赖

`pip install -r requirements.txt`

4.数据库同步以及配置

- 项目需要使用mysql和redis数据库，所以请在部署本项目前先安装mysql和redis

- 在部署向目前，先在webscanner/settings.py文件中进行数据库配置

  ```python
  # 数据库配置用mysql
  DATABASES = {
      'default': {
          'ENGINE': 'django.db.backends.mysql',
          'NAME': 'webscan',
          'USER': 'root',
          'PASSWORD': '', # 在这里输入密码
          'HOST': 'localhost',
          'PORT': '3306',
      }
  }
  ```

- 数据库配置完毕后，请在本地数据库新建一个名为webscan的数据库，用于存放本项目的相关数据，数据库建好后在项目根目录用以下命令来迁移和同步项目文件

  `python manage.py makemigrations`

  `python manage.py migrate`

- 项目的数据库文件已经导出在根目录下的webscan.sql，导入方法请自行百度



## 项目部署

1.开启redis服务

- 安装了redis服务后，进入到项目里的Redis-x64-5.0.14.1文件夹，使用如下命令开启redis服务

  `redis-server.exe redis.windows.conf`

2.开启celery服务

- redis服务开启后新开一个控制台窗口，输入如下命令开启celery服务。开启celery服务前，请确定虚拟环境中已经安装了celery库，且命令中的"-P eventlet"选项只在windows环境中加入，如果是linux环境部署则不需要此选项

  `celery -A celery_tasks.main worker -l info -P eventlet --pool=solo`

- **切记redis和celery的开启顺序不能改变，先开启redis再开启celery，因为celery的正常工作需要redis来作为缓存数据库。成功开启celery应该如下图所示（左celery 右redis数据库）**

  ![image-20230820032139974](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820032139974.png)

3.启动服务

- 一切就绪后使用以下命令启动服务

  `python manage.py runserver`

- 启动后进入浏览器访问以下网址

  `127.0.0.1:8000`

- 当看到如下登陆界面时，说明项目部署成功

  ![image-20230820034329159](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820034329159.png)

**4.漏洞扫描**

- **如果想使用漏洞扫描功能，则需要下载AWVS13.0漏洞扫描工具，并在settings.py中的第130行配置AWVS的密钥信息**

  ```python
  # 1.5配置awvs的密钥信息
  AWVS_API_KEY = "1986ad8c0a5b3df4d7028d5f3c06e936c4441913fd2af4ef3942a8ef539e98df9"
  ```

- **密钥在AWVS的个人设置里生成，如下图所示**

  ![image-20230820034824405](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820034824405.png)

## 示例和演示

1.登陆进入到主界面后，会通过echarts显示一些图标信息以及通过网络爬虫获取的安全资讯和漏洞扫描历史数据等信息

![image-20230820035233578](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820035233578.png)

2.漏洞扫描界面会显示历史扫描记录

![image-20230820035306051](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820035306051.png)

3.对于扫描完成的目标，通过点击域名，会进入到详情页,这里可以查看目标更详细的信息，且通过点击中间的漏洞，在右边则会实时的显示出此漏洞的详细信息

![image-20230820035501363](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820035501363.png)

4.在端口扫描和后台扫描中，输入合法的url地址后点击开始扫描，就会通过celery在后台实时进行扫描任务，并会在扫描结束后，实时的将数据放在表格中

![image-20230820035733735](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820035733735.png)

5.扫描完成后结果

![image-20230820035924159](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820035924159.png)

6.信息收集和工具等功能都是通过网络爬虫，进行数据的收集和汇总，对收集到的数据进行整理和分析后放在页面上，如图所示

![image-20230820040007672](https://gitee.com/maverick0407/webscanner/raw/master/static/media/image-20230820040007672.png)

## 常见问题

1.漏洞扫描功能无法使用

- 请确保您已经下载了AWVS工具(工具的下载请自行搜索)，并在settings.py中配置好了密钥信息

2.端口扫描或后台扫描功能无法使用

- 如果遇到这种情况，请尝试调整celery_tasks文件夹中的任务对应的tasks.py文件，更尝试更改ports_per_thread参数，这是因为由于项目运行的环境不同，扫描能力也不同，请结合实际情况更改此参数来正常运行项目

  ```python
      def __init__(self, host,ports_per_thread=140): # 如果无法正常允许请尝试更改这个参数
          """
          初始化函数，设置要扫描的目标主机和每个线程内允许扫描的端口数量。我的奠奈最多就是140，65535个端口就开差不多500个线程，多了就要报错了
          参数:
              host (str): 要扫描的目标主机的IP地址或主机名。
              ports_per_thread (int, optional): 每个线程内允许扫描的端口数量。默认为140。
          """
          self.i = 0
          self.host = host
          self.open_ports = []
          self.ports_per_thread = ports_per_thread
  ```

3.首页无法加载

- 如果遇到首页无法加载的情况，请检查数据库是否配置正常。如果数据库连接正常，请检查AWVS配置是否正确，因为首页会显示部分AWVS得信息

4.信息收集无法正常使用

- 如遇此问题，大概率是网络问题，此功能所使用得爬虫为requests+bs4单线程爬虫，受网络影响、目标网站以及环境配置等因素影响较大，如果信息获取失败请多尝试几次。同时也欢迎各位能多提建议，能将项目fork过去对项目进行更进一步的优化

## 贡献指南

如果你希望其他人为项目做出贡献，可以在这一部分提供贡献指南，包括以下内容：

1.在开始之前，请确保您已经阅读并理解了项目的代码行为准则和许可证。

2.如果您发现了 bug 或者有新的功能请求，请先查看项目的 issue 页面，以确保相关问题尚未被其他人报告或讨论。如果该问题已存在，请在现有的 issue 下进行评论。

3.如果您希望修复 bug 或者添加新的功能，请按照以下步骤进行：

- Fork 本项目到您的 Gitee 账号下
- 在本地进行项目的克隆：`https://gitee.com/maverick0407/webscanner.git`
- 创建一个新的分支并切换到该分支：`git checkout -b your-feature-branch`
- 进行必要的修改或添加新的功能
- 提交您的更改：`git commit -m "Add your commit message here"`
- 推送您的分支到远程仓库：`git push origin your-feature-branch`
- 提交一个 Pull Request（PR）到项目的主仓库，描述清楚您所做的修改或添加的功能。请确保 PR 是基于最新的主分支进行的。

4.一旦您的贡献被接受并合并到主仓库中，您的更改将会被包含在下一个发布版本中。

5.如果对项目有好的建议或者对项目有更多问题，欢迎咨询作者邮箱：1484333494@qq.com😊

6.网上很多都是收费的，作者当时写的时候也碰到了很多问题，所以如果你觉得这个项目帮助了你，可以考虑为作者后续开发更多好的项目提供一点援助，万分感谢！

![image-20230820040007672](https://gitee.com/maverick0407/webscanner/raw/master/static/media/fdc997ca12007398a8c60abbef32e81c.jpg)





















