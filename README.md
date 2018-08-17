# 爬取微信商户平台全国各银行地方支行信息
通过 Python 爬取微信商户平台各个地区各个银行所有支行信息，算目前最全的全国支行信息。已经整理了可直接导入数据库的 sql 文件

> 需要先登录微信商户平台，主要是接口调用需要 Session 保持，登录拿到需要的 token 就可以获取所有需要的数据了。目前观察微信没有对接口访问速率和ip做限制，意味着随意请求。

### 使用步骤
1. 需要有一个微信商户平台账号，没有注册
2. 登录账号进入企业信息提交页面

![hehe](https://wx2.sinaimg.cn/mw690/005X6W83gy1fuclnujz27j31kw0wt48b.jpg)

3. 打开浏览器调试信息，然后选择银行地区
4. 查看 network
![hhh](https://wx1.sinaimg.cn/mw690/005X6W83gy1fuclocaqtvj31kw0fqapy.jpg)
现在已经可以看到返回的结果了，但是这只是单个地区单个银行的支行信息，接下来需要使用爬虫代替我们去查其他的支行信息。
5. 查看请求头信息，记下下请求信息
![data](https://wx4.sinaimg.cn/mw690/005X6W83gy1fuclog2d8wj31cc0hwmzs.jpg)
6. 那么这个银行省市编号怎么来的呢？

> 也是在此爬的，不过比较简单，我已经全部整理好了，详情见[static_data.py](https://github.com/hymanme/Subbranch-China/blob/master/static_data.py)

7. 最后在 [bank.py](https://github.com/hymanme/Subbranch-China/blob/master/bank.py) 脚本中替换你的 cookie 商户id 等参数之后直接运行，静等结果。

### 直接使用
我已经将省市支行信息全部整理好，在 [data](https://github.com/hymanme/Subbranch-China/tree/master/data) 目录下，包括原始返回的 json 数据，以及整理好的可直接导入的 sql 文件，自取。

### 数据来源于网络，侵删
💆
### License
```
Copyright (C) 2018 Hymane

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```


