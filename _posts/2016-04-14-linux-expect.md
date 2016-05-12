---
layout: post
title:  "linux-expect"
keywords: "linux, expect"
description: "linux expect的学习"
category: linux
tags: [linux]
---

### 题记
在我没有搭建基于[jenkins]()的持续集成平台时，项目都是我手动的打包，然后scp到linux服务器，再重启服务。期间，要重复的输入[ssh]()的密码，我就想有没有一种简单的方式，能写一个脚本来一键进行这些操作。
### 语法：
` #!/usr/bin/expect ` 告诉操作系统脚本代码使用哪一种shell执行    
` set timeout 300` 设置超时时间，比如ssh时等待出现密码输入界面时间  
` spawn ssh root@192.168.1.100` <sub><a href="http://wiki.tcl.tk/10045">spawn</a></sub>进入expect环境后，创建一个expect管理的与其他程序或者远程设备交互的session，用来传递交互指令。  
` expect "password"` 判断上次输出结果里面是否包含"password"字符串，等待时间就是之前的timeout。  
` send "123456\n"` 比如执行输入密码操作，并确定。  
` interact` 执行完成后保持交互操作，将控制权交给控制台。

### 例子
##### 下面是之前的一个例子
``` bash
#!/usr/bin/env bash

# 执行js和css压缩操作
cd /Users/huangrupeng/work/java/idea/workspace
grunt cssmin uglify
# 执行打包操作
mvn clean install -Pproduct
# 执行上传操作
cd /Users/huangrupeng/work/java/workspace/idea/rp/rp-4-study/src/main/shell

hostname="192.168.1.100"
username="root"
password="111111"
sourcefile="/Users/huangrupeng/work/java/idea/workspace/war/ROOT.war"
destdir="/usr/local/tomcat/"

# 将包上传到服务器
# expect 后面使用单引号,引用外部变量,同样要用单引号
expect -c '
    spawn scp '$sourcefile' root@'$hostname':'$destdir'
    set timeout 100
    expect {
        password {
            # 这个地方得使用两个斜杠
            send  "'${password}'\n"
            #显示scp进度
            interact
        }
    }
'
bkwarname="`date +%Y%m%d-%H%M`-ROOT.war.bak"
# 进入expect
expect -c '
    spawn ssh root@'$hostname'
    set timeout 100
    send_user "'${username}'\n"
    expect {
        password {
            send  "'${password}'\n"
        }
    }
    # 开始执行打包操作
    send "pkill -9 java\n"
    send "cd /usr/local/tomcat/webapps\n"
    send "mv ROOT.war '${bkwarname}'\n"
    send "mv ../ROOT.war .\n"
    send "rm -rf ROOT\n"
    send "cd /usr/local/tomcat/bin\n"
    send "./startup.sh\n"
    send "tail -f /usr/local/tomcat/logs/catalina.out\n"
    # 将窗口停留在交互状态
    interact
'



```