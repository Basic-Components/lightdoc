---
layout: default
title: Windows安装Jekyll
---

# Windows安装Jekyll

本文章针对Windows用户，说明Windows下如何安装环境并构建本项目。

>参考原文：http://jekyll-windows.juthilo.com/

## 安装 Ruby

网址：http://rubyinstaller.org/

编写本文使用的版本：rubyinstaller-2.3.3-x64.exe

记得勾选环境变量。

## 安装 DevKit

网址：http://rubyinstaller.org/downloads/

编写本文使用的版本：DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe

这里下载的是自解压程序，当你运行程序时，会弹窗提示你解压到哪个位置。此时，你需要输入路径并且不能包含空格。我们推荐一些例子给你，如`C:\RubyDevKit`。点击 Extract 并等到解压完毕。

现在你需要初始化DevKit，并且将它绑定到你的Ruby安装目录。打开你喜欢的命令行工具，切换目录到你刚刚解压时设置的DevKit目录
```
cd C:\RubyDevKit
```
执行命令进行初始化，如果前面的ruby环境变量已经正确勾选，这里执行是没问题的。
```
ruby dk.rb init
```
执行命令进行安装DevKit
```
ruby dk.rb install
```
执行命令更换gem源为中国镜像(http://gems.ruby-china.org/)
```
gem sources --add http://gems.ruby-china.org/ --remove https://rubygems.org/
```
执行命令安装 bundle和jekyll
```
gem install bundle jekyll
```
执行命令更换Gemfile 和 Bundler为中国镜像
```
bundle config mirror.https://rubygems.org http://gems.ruby-china.org
```
