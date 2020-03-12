# ***Manager Rest Api 汇总***
## **Manager Rest Api 目录**
- **signIn** -- 登录接口
- **signUp** -- 注册接口
- **userDetail** -- 用户信息接口
- **goodsList** -- 商品列表接口
- **goodsDetail** -- 商品信息接口
- **pay** -- 支付接口
- **orderList** -- 订单列表接口
- **rushToBuy** -- 抢购接口
- **pendingPayment** --获取购物车信息
- **payPendingPayment** --购物车内商品付款
## Api接口返回码说明
``` text
    成功：ManagerService.200
    失败：ManagerService.400
```
## Api 调用URL前缀
- **Url:http://111/manager-demo/**
## Api 接口详细介绍
#### 1）、登录接口
- rest接口：**v1/rest/signIn**
- 请求类别：post
- 请求参数：
``` json
{
    "userName":"jack",
    "userPwd":"123"
}
```
- 返回结果：
``` json
{
    "errCode":"ManagerService.200",
    "resMsg":[
        {
            "userId":5,
            "userName":"Jack"
        }
    ],
    "signInResult":"SignInSuccess"
}
```     
#### 2)、注册接口
- rest接口：**v1/rest/signUp**
- 请求类别：Post
- 请求参数：
``` json
{
	"userName": "trump",
	"userPwd": "123"
}
```
- 返回结果：
``` json
{
	"errCode": "ManagerService.200",
	"resMsg": [{
		"userId": 24490,
		"userName": "trump"
	}]
}
```
#### 3)、用户信息接口
- rest接口：**v1/rest/userDetail**
- 请求类别：Post
- 请求参数：
``` json
{
	"userId": 1
}
```
- 返回结果：
``` json
{
	"errCode": "ManagerService.200",
	"resMsg": [{
		"userBalance": 7578,
		"userHeadPortraitPath": "-",
		"userId": 1,
		"userLevel": 0,
		"userName": "jack",
		"userSex": "-"
	}]
}
```
#### 4)、商品列表接口
- rest接口：**v1/rest/goodsList**
- 请求类别：get
- 请求参数：
``` text
    goodsType:Normal #Param:Normal or RushToBuy
```
- 返回结果：
``` json
{
	"errCode": "ManagerService.200",
	"resMsg": [{
			"goodsId": 1,
			"goodsName": "milk",
			"goodsPicturePath": "xxxx",
			"goodsPrice": 2
		},
		{
			"goodsId": 2,
			"goodsName": "apple",
			"goodsPicturePath": "xxxx",
			"goodsPrice": 2
		},
		{
			"goodsId": 3,
			"goodsName": "meat",
			"goodsPicturePath": "xxxx",
			"goodsPrice": 2
		}
	]
}
```
#### 5)、商品信息接口
- rest接口：**v1/rest/goodsDetail**
- 请求类别：get
- 请求参数：
``` text
    goodsId:1
    goodsType:Normal #param:Normal or RushToBuy
```
- 返回结果：
``` json
{
	"errCode": "ManagerService.200",
	"resMsg": [{
		"goodsCount": "9988",
		"goodsDescribe": "None",
		"goodsId": 1,
		"goodsName": "Milk",
		"goodsPicturePath": "xxx",
		"goodsPrice": 2,
		"goodsType": "Normal"
	}]
}
```
#### 6)、支付接口
- rest接口：**v1/rest/pay**
- 请求类别：post
- 请求参数：
``` json
{
	"userId":"1",
	"goodsId":"1",
	"goodsPrice":"2",
	"goodsType":"Normal" #Param:Normal or RushToBuy
}
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":"PaySuccess"
 }
```
#### 7)、订单列表接口
- rest接口：**v1/rest/orderList**
- 请求类别：post
- 请求参数：
``` json
{
	"userId":"1"
}
```
- 返回结果：
``` json
{
	"errCode": "ManagerService.200",
	"resMsg": [{
		"goodsId": 1,
		"goodsName": "Milk",
		"goodsPicturePath": "xxx",
		"goodsPrice": 2,
		"ordersDate": "2018-08-15 11:20:15",
		"ordersId": 46
	}]
}
```
#### 8)、抢购接口
- rest接口：**v1/rest/rushToBuy**
- 请求类别：post
- 请求参数：
``` json
{
	"userId": "1",
	"goodsId": "xxxxx"
}
```
- 返回结果：
``` json
{
	"errCode": "ManagerService.200",
	"resMsg": "Success"
}
```
#### 9)、获取购物车信息
- rest接口：**v1/rest/pendingPayment**
- 请求类别：get
- 请求参数：#Param userId
- 返回结果：
``` json
{
	"errCode": "ManagerService.200",
	"resMsg": [{
		"goodsId": 5,
		"goodsName": "Peach",
		"goodsPicturePath": "xxx",
		"goodsPrice": 2,
		"pendingPaymentId": 245,
		"userId": 24485
	}]
}
```
#### 10 )、购物车内商品付款
- rest接口：**v1/rest/payPendingPayment**
- 请求类别：post
- 请求参数：
``` json
{
	"userId": "xxx",
	"goodsId": "xxx",
	"goodsPrice": "xxx",
	"pendingPaymentId": "xxx"
}
```
- 返回结果：
``` json
{
	"errCode": "DbService.200",
	"resMsg": "PaySuccess"
}
```