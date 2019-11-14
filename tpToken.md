tpToken 以太坊节点接口使用文档

接口框架为ThinkPHP 5.0  PHP版本7.2  MYSQL版本5.7

服务器要求

1.安装redis 及redisPHP扩展

2.安装RabbitMQ 及 amqp扩展

3.安装gmp扩展

4.接口服务器与节点服务器内网方式链接，或同一台服务器

5./tmp/ 下添加coin文件夹 用于存放接口日志文件

接口使用

1.修改配置文件 application下的

	1）Config.php Redis配置信息/钱包节点服务器配置信息/RabbitMQ配置信息

	2）DataBase.php 数据库配置文件

接口说明

api/controller 文件说明

1. ApiBase.php 接口入口 主要用与检测接口权限 及签名验签

2. Tokenapi.php 接口方法文件 
	
	1）添加方法后需在ApiBase.php $minActList变量里添加大写方法名 

	2）接口有两种验签方式 1.sign 2.rsa和aes 添加方法后需在ApiBase.php里选择验签方式

3. Crontab.php 定时任务方法文件

api/common 文件说明

1. controller

	1） RabbitMQ.php  RabbitMQ消息通讯 消费时的方法 充/提订单广播/手动商户归集/用户提现处理

	2） RedisLib.php redisPHP方法

	3） Tokenlist.php 充值轮询方法及单节点高度订单补单方法

2. Curl

	1)  Curl.php  curl方法

3. EXT

	1） EthClient.php 以太坊节点服务器交互方法 后可加入BTC/EOS

4. Mapi

	1) Mapi.php 各钱包节点服务器中间件接口入口文件 暂时无用

	2）Wallet.php 生成各类钱包 助记词 私钥 导入节点钱包生成地址 

	3）Walletadd.php 各钱包节点服务器中间件接口文件

5. RabbitMQ

	1）RabbitConsumer.php RabbitMQ消息通讯消费信息文件

	2）RabbitPublish.php RabbitMQ消息通讯发送消息文件

6. Sign

	Aes.php Aes加密解密方法

	Rsa.php Rsa加密解密方法	 	

api/crontab/command 文件说明

	1）CoinGuiJi.php 定时计划：每10秒处理一次手动归集消息

	2）CoinReturn.php 定时计划：每五分钟发送充值提现订单广播

	3）CoinWithdraw.php 定时计划：每五秒钟消费提现订单

	4）GetCoinReturn.php 定时计划：每五秒钟消费充值提现订单广播

	5）Task.php 定时计划：每十秒钟获取一次充值记录

	添加新任务后需在 applicattion/command.php 添加引入路径

	服务器端写定时任务脚本执行 php /home/wwwroot/tpToken/think CoinReturn

