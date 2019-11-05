# 鑫通达销售APP
本APP用于网络销售鑫通达管业公司所生产的产品。

该APP的设计理念为前后端分离设计。前端采用了flutter框架编写，坚持业务逻辑与代码表现层相分离，后端采用了Python——flask——RESTFUL框架。数据库使用了关系型数据库sqlite,目前有goods,category,subcategory,comment四张表。前后端的数据传输类型采取了json形式

## 设计思路
___
1. 首先将公司的产品分类，建立一级类目与二级类目
   !["鑫通达产品分类"](https://i.ibb.co/1KyyHbv/image.png)
2. 构建了数据库表，并且填充数据
!['数据库设计'](https://i.ibb.co/nQhddgg/20191105224146.png)
3. 编写flask————restful后台，收到请求，执行SQL语句，格式化数据，最终返回json数据
!['后端接口设计'](https://i.ibb.co/pyXyYft/20191105224214.png)
4. 编写APP前端，封装数据请求方法，在每个页面的Provider中，请求数据，转化数据（模型化，对象化），分配数据，使用数据（显现）

## 可改进的地方
___
1. 添加微信，支付宝支付功能
2. 添加账号机制
3. 添加订单机制
4. 改善前端页面中的小bug
5. 增加在线升级的功能
