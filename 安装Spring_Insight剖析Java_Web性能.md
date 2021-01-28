# 安装Spring Insight剖析Java Web性能

### 下载TC Server

本案例使用的是STS（Spring Tools Suits）自带的TC Server。

### 下载Spring Insight模块

在2014年以前，STS自带的TC Server里面自包含Spring Insight模块，而之后发布的版本都默认去除了Spring Insight模块。

因此，我们需要通过TC Server自带的命令从远程仓库下载Spring Insight模块。

* 查找Spring Insight模块（tcruntime-admin.bat get-template）

```
D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE>tcruntime-admin.bat get-template
Available Templates:

  redis-session-manager - Overrides default session manager and stores HTTP sessions in Redis instance
  spring-insight-developer - Spring Insight Developer Edition
```

可以看到，远程仓库有两个模块供我们下载，分别是：redis-session-manager和spring-insight-developer。这里我们需要的是spring-insight-developer模块。

* 下载Spring Insight模块（tcruntime-admin.bat get-template spring-insight-developer）

```
D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE> tcruntime-admin.bat get-template spring-insight-developer
Downloading archive: spring-insight-developer from repository
Extracting archive to D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE\templates
Successfully extracted archive to D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE\templates
```

下载的模块会保存到TC Server的templates目录下的insight文件夹。

* 根据模块创建容器实例(tcruntime-instance.bat create 容器名称 -t 模块名称)

这里我们将创建的容器实例命名为v8：

```
D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE>tcruntime-instance.bat create v8 -t insight
Creating instance 'v8' ...
  Using separate layout
  Creating bin\setenv.bat
  Creating conf\wrapper.conf
  Applying template 'base'
    Copying template's contents
    Applying fragment 'context-fragment.xml' to 'conf/context.xml'
    Applying fragment 'server-fragment.xml' to 'conf/server.xml'
    Applying fragment 'web-fragment.xml' to 'conf/web.xml'
    Applying fragment 'tomcat-users-fragment.xml' to 'conf/tomcat-users.xml'
    Applying fragment 'logging-fragment.properties' to 'conf/logging.properties'
    Applying fragment 'catalina-fragment.properties' to 'conf/catalina.properties'
  Applying template 'base-tomcat-85'
    Copying template's contents
    Applying fragment 'context-fragment.xml' to 'conf/context.xml'
    Applying fragment 'web-fragment.xml' to 'conf/web.xml'
    Applying fragment 'logging-fragment.properties' to 'conf/logging.properties'
    Applying fragment 'catalina-fragment.properties' to 'conf/catalina.properties'
  Applying template 'insight'
    Copying template's contents
    Applying fragment 'server-fragment.xml' to 'conf/server.xml'
  Configuring instance 'v8' to use Tomcat version 8.5.4.B.RELEASE
  Setting permissions
Instance created
Connector summary
  Port: 8080   Type: Auto-Switching HTTP 1.1   Secure: false
```

看到上面的输出后说明我们已经成功创建容器实例。

* 注册service

这一步是Windows必须的，而Linux系统不需要这一步骤。

```
D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE>tcruntime-ctl.bat v8 install
Installing instance at D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE\v8
wrapper  | Pivotal tc Runtime instance - tcruntime-D-sts-bundle3.8.2-pivotal-tc-server-developer-3.2.0.RELEASE-v8 installed.
```

* 启动容器

```
D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE>tcruntime-ctl.bat v8 start
Starting instance at D:\sts-bundle3.8.2\pivotal-tc-server-developer-3.2.0.RELEASE\v8
wrapper  | Starting the Pivotal tc Runtime instance - tcruntime-D-sts-bundle3.8.2-pivotal-tc-server-developer-3.2.0.RELEASE-v8 service...
wrapper  | Pivotal tc Runtime instance - tcruntime-D-sts-bundle3.8.2-pivotal-tc-server-developer-3.2.0.RELEASE-v8 started.
```

* 部署war包

将我们的war包复制到v8容器的webapps目录下,这里我的war包是mvc.war。

* 打开Spring Insight

在浏览器输入 http://localhost:8080/insight （默认8080端口），成功后的界面如下：

<img src="images/spring-insight.png" target="_blank"/>