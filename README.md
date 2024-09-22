## 本项目实现的最终作用是基于SSH公交路线查询网站系统
## 分为2个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 公交迷论坛管理
 - 图片管理
 - 新闻管理
 - 用户管理
 - 留言管理
 - 管理员登陆
 - 线路管理
 - 资源管理
### 第2个角色为用户角色，实现了如下功能：
 - 公交新闻
 - 公交查询
 - 公交论坛
 - 公交车图片
 - 用户留言
 - 用户首页
 - 系统介绍
 - 资源上传下载
## 数据库设计如下：
# 数据库设计文档

**数据库名：** ssh_gjcx_sys

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [tb_detail](#tb_detail) |  |
| [tb_forum](#tb_forum) |  |
| [tb_gg](#tb_gg) |  |
| [tb_line](#tb_line) |  |
| [tb_load](#tb_load) |  |
| [tb_manager](#tb_manager) |  |
| [tb_member](#tb_member) |  |
| [tb_message](#tb_message) |  |
| [tb_pic](#tb_pic) |  |
| [titles](#titles) |  |

**表名：** <a id="tb_detail">tb_detail</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   varchar   | 255 |   0    |    N     |  Y   |       | ID  |
|  2   | forumid |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  3   | content |   varchar   | 4000 |   0    |    Y     |  N   |   NULL    | 内容  |
|  4   | who |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | intime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_forum">tb_forum</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 255 |   0    |    N     |  Y   |       | 主键  |
|  2   | title |   varchar   | 1000 |   0    |    N     |  N   |       |   |
|  3   | father |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  4   | intime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_gg">tb_gg</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 255 |   0    |    N     |  Y   |       | 主键  |
|  2   | title |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | content |   varchar   | 4000 |   0    |    N     |  N   |       | 内容  |
|  4   | INTime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_line">tb_line</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 255 |   0    |    N     |  Y   |       | 主键  |
|  2   | nameboard |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  3   | routef |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  4   | routeend |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  5   | runtime |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  6   | price |   varchar   | 255 |   0    |    N     |  N   |       | 价格  |
|  7   | globalprice |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  8   | site |   varchar   | 4000 |   0    |    N     |  N   |       |   |
|  9   | frequency |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  10   | prompt |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  11   | mold |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  12   | memo |   varchar   | 4000 |   0    |    N     |  N   |       |   |

**表名：** <a id="tb_load">tb_load</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 255 |   0    |    N     |  Y   |       | 主键  |
|  2   | name |   varchar   | 255 |   0    |    N     |  N   |       | 名字  |
|  3   | url |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 网络地址  |
|  4   | intime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_manager">tb_manager</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | manager |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  3   | pwd |   varchar   | 255 |   0    |    N     |  N   |       | 密码  |

**表名：** <a id="tb_member">tb_member</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 255 |   0    |    N     |  Y   |       | 主键  |
|  2   | username |   varchar   | 255 |   0    |    N     |  N   |       | 用户名  |
|  3   | trueName |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  4   | password |   varchar   | 255 |   0    |    N     |  N   |       | 密码  |
|  5   | ADDRESS |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 地址  |
|  6   | email |   varchar   | 45 |   0    |    Y     |  N   |   NULL    | 邮箱  |

**表名：** <a id="tb_message">tb_message</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 255 |   0    |    N     |  Y   |       | 主键  |
|  2   | title |   varchar   | 255 |   0    |    N     |  N   |       | 标题  |
|  3   | who |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  4   | content |   varchar   | 4000 |   0    |    N     |  N   |       | 内容  |
|  5   | intime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | reflex |   varchar   | 4000 |   0    |    Y     |  N   |   NULL    |   |
|  7   | renamea |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_pic">tb_pic</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 255 |   0    |    N     |  Y   |       | 主键  |
|  2   | name |   varchar   | 255 |   0    |    N     |  N   |       | 名字  |
|  3   | content |   varchar   | 5000 |   0    |    Y     |  N   |   NULL    | 内容  |
|  4   | pic |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 图片  |
|  5   | intime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | memo |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |

**表名：** <a id="titles">titles</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ISBN |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  2   | title |   varchar   | 255 |   0    |    N     |  N   |       | 标题  |
|  3   | EDITIONNUMBER |   int   | 10 |   0    |    N     |  N   |       |   |
|  4   | COPYRIGHT |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  5   | PUBLISHERID |   int   | 10 |   0    |    N     |  N   |       |   |
|  6   | IMAGEFILE |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  7   | PRICE |   varchar   | 18 |   0    |    N     |  N   |       |   |

