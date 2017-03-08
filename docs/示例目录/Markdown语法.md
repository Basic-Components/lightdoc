---
layout: default
title: LightDoc
---

# Markdown 语法

![图片](images/logo.png)

[TOC]

# 标题

## 标题

### 标题

#### 标题

##### 标题

###### 标题

**加粗文字**

*斜体*

>引用

- 列表
- 列表
- 列表

1. 列表
2. 列表
3. 列表

命令`echo "Hello"`

```php
// PHP Code
echo "Hello world!";
```

```ruby
// Ruby Code
puts "Hello world!"
```

表格

| Item      |    Value | Qty  |
| :-------- | --------:| :--: |
| Computer  | 1600 USD |  5   |
| Phone     |   12 USD |  12  |
| Pipe      |    1 USD | 234  |

流程图
```flow
st=>start: Start
e=>end
op=>operation: My Operation
cond=>condition: Yes or No?

st->op->cond
cond(yes)->e
cond(no)->op
```

以及时序图:

```sequence
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
```

