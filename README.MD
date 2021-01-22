## 整体介绍

共四个jsp webshell 用来参加青藤webshell bypass 活动。以下基于自己对java理解的一些原创，主要的bypass的思路是找到java里和php类似的灵活性写法：jdk内置javascript引擎，class字节码加载

* 0.jsp
最直接的写法直接over。另外发现windows defender也有对webshell检查。

![image](https://github.com/huzhanchi/webshell/blob/main/images/defender.png)

* 1.jsp
jdk自带javascript引擎，其中从jdk1.6默认实现是：Rhino jdk1.8之后是：nashorn。代码中有对jdk不同版本做了适配。

* 2.jsp
1.jsp中只是使用了js引擎，但是还没充分发挥动态脚本混淆和变形的能力，2.jsp只是简单的做了下替换变形。

* cls.jsp
这个是基于defineClass0 加载字节码来bypass。当时的思路也是想历次的入侵黑客喜欢用base64做些绕过，java可以动态加载字节码，字节码十六进制传递很难去做waf正则匹配。
后面在研究 ”冰蟹“ 的时候看到也用了defineclass方式。

## jep委员会，开发者 与安全三者的感想
对jdk中内置javascript引擎，从开发角度来讲是否一定要内置值得商榷。的确java开发者有比较强的 动态脚本 的需求，比如我自己做些规则引擎，配置系统的时候常用到这样的特性。
动态脚本支持可以参考java对groovy用第三方依赖的方式实现，而不是内置。现实情况下内置的javascript引擎性可能不满足应用需求，比如jdk自己就因为性能问题从1.8将实现换掉了。到了jdk15提案中又有人提议替换掉nashorn。
还有在自己研究百度openrasp的时候，可以看到最早起版本他们对java应用rasp的防护规则执行引擎实现就是基于jdk的内置javascript引擎实现，而到最后是直接利用jni 调用V8引擎增加实时性。
一句话javascript引擎哪家强有由用户自己决定吧

## 对比其他webshell工具
在写完上面的几个jsp的webshell的时候，和部门做渗透同事交流他提到过一个“冰蟹”。以前对webshell工具的理解上更多的关注自动化，方便，比如“中国菜刀”。但是“冰蟹”不同，他把平时我们开发服务端的协议交互的逻辑去增强bypass能力。
在上次的红蓝对抗中同事有用到 ”中国菜刀“，经过取证溯源能找到很明显的特征。现在想想如果用的是”冰蟹“该如何？
