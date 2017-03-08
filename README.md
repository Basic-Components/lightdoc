# LightDoc

by Guangqing Li

项目更新日期：2017-03-08

这是我为自己的团队基于 Jekyll 开发的文档系统。必须声明的是，这可能不适合大家的需求，毕竟是自己内部使用然后拿出来开源的，还请大家见谅。

**演示地址:** https://clyoko.coding.me/lightdoc

首先要说明的是，本项目需要本地构建操作（部署到自己的服务器除外）。

因为用 Ruby 写了个 Jekyll 插件来生成文件目录树，而 Coding Pages 和 GitHub Pages 在运行 Jekyll 时会带上`--safe`参数，导致插件无法运行。部署到自己的服务器的话，可以允许始终运行插件。

故需要自己在本地执行`jekyll build`来构建一遍。提交到 Git 后，无需任何操作，Pages 会自动更新。如果大家有什么便捷方法，还请不吝指教。

[TOC]

## 快速开始

如果你的电脑已经有 Jekyll ，那么只需要

1. 下载项目到本地。
2. 书写你的文档，在文档开头加入下面这个固定的头信息，存放到`/docs`目录中。

```
---
layout: default
title: 你的文章标题
---
```

3. 在项目目录中执行命令`jekyll build`来生成目录树。（部署到自己的服务器时可省略）
4. Push 到你的 Git 仓库

Coding Pages 和 GitHub Pages 将会自动部署你的文档。

## 目录说明

- `/docs` 用户文档目录，允许多级目录，文件(夹)名允许中文。
- `images` 用户图片目录。如文件`a.jpg`，在md文档中这样使用`![这是图片](images/a.jpg)`。

## 方便大家

这里给出一些我在Windows安装Jekyll的文档。http://

## 注意事项

如果用户文档目录`/docs`中使用中文文件名，在本地调试时可能无法打开相应的页面，在Coding Pages 和 GitHub Pages 可正常打开。

如有大家有解决方案，请多多指教。

## 使用到的项目

感谢这些项目，令本项目得以快速实现。

- jQuery
- Editor.md
- jsTree
- highlight.js

## 参考项目

- Coding Help（https://coding.net/u/coding/p/coding-docs/git）
- 看云（http://www.kancloud.cn/）
- ShowDoc（https://www.showdoc.cc/）

## License

Apache License 2.0
