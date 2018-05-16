# LightDoc

本项目fork自<https://github.com/hyperqing/lightdoc> 感谢作者Guangqing Li

本项目是个一个比较轻量级的项目文档主题,支持:

1. 按层次组织文档
2. 流程图
3. 表格
4. 数学公式

特点:

1. 简单轻量
2. 少有的项目主题
3. 方便定制

## 用法

1. 配置`_config.yml`

    修改其中的:
    + `title`: 项目标题
    + `email`: 项目开发者email
    + `keywords`: 项目主题
    + `description`: 项目简介
    + `baseurl`: 基url,方便那些使用第一级uri区分项目的用法 # 域名xxx.com直接访问本项目的填'/'，带目录域名xxx.com/example访问本项目的填'/example/'
    + `url`: 项目域名# "http://0.0.0.0:4000" # 域名

2. 项目主页可以使用`markdown`修改`index.html`文件
3. 项目文档放在`docs`文件夹下,格式请看例子
4. 项目的目录通过修改`_includes/gen_sidebar.html`修改
