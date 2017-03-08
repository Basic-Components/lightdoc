# lightdoc

by Guangqing Li

项目更新日期：2017-03-08

这是我为自己的团队开发的文档系统，是基于jekyll开发的。必须声明的是，这可能不适合大家的需求，毕竟是自己内部使用然后拿出来开源的，还请大家见谅。

**演示地址:** http://


首先要说明的是，本项目需要本地构建操作。

因为用 Ruby 写了个 Jekyll 插件来生成文件目录树，而 Coding Pages 和 GitHub Pages 在运行 Jekyll 时会带上`--safe`参数，导插件无法执行。

故需要自己在本地执行`jekyll build`来构建一遍。提交到 Git 后，无需任何操作，Pages 会自动更新。如果大家有什么便捷方法，还请不吝指教。

[TOC]

## 快速开始

## License

Apache License 2.0
