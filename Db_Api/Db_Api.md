# **综合Demo后台rest接口使用说明**

> 主要包含Manager和Database Control两个模块后台接口的实现（共17个接口），主要对应用户的注册、登录、订单查询以及商品的展示、购买、抢购等业务功能。
## **一、后台主要接口总览**
### **1、Database Control模块**
- **querySimpleUserInfoByName**--简单用户信息查询接口（用于登录验证）
- **queryUserDetailInfoById** -- 用户信息详情查询接口
- **addUser** -- 增加用户接口
- **queryGoodsDetail** -- 商品信息查询接口
- **queryGoodsList** -- 商品列表查询接口
- **queryOrdersList** -- 订单列表查询接口
- **pay** -- 支付接口 
- **payPendingPayment** -- 申请支付接口
- **queryBalance** -- 余额查询接口
- **queryGoodsCount** -- 商品库存查询接口
### **2、rushToBuyTestScene模块**
- **addTestUser** --增加测试用户接口
- **queryTestUser** --查询测试用户接口
- **queryTestUserCount** --查询测试用户数接口
- **cleanTestUser** --清除测试用户接口
- **queryRushToBuySuccessUser** --查询抢购成功用户接口
- **queryRushToBuySuccessCount** --查询抢购成功数接口
- **queryTestUserIdRange** --查询测试用户ID范围接口


## **二、测试接口详细说明**
### **1、Database Control模块**

Database Control模块错误码说明
``` text
    成功：DbService.200
    失败：DbService.400
```
#### 1）、简单用户信息查询接口（用于登录验证）
- rest接口：**v1/rest/querySimpleUserInfoByName**
- 请求类别：post
- 请求参数：
``` json
{
    "userName":"jack"
}
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "userId":1,
            "userName":"Jack",
            "userPwd":"xxxx"
        }
    ]
}
```
#### 2）、用户信息详情查询接口
- rest接口：**v1/rest/queryUserDetailInfoById**
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
    "errCode":"DbService.200",
    "resMsg":[
        {
            "userBalance":7574,
            "userHeadPortraitPath":"-",
            "userId":1,
            "userLevel":0,
            "userName":"Jack",
            "userSex":"-"
        }
    ]
}
```
#### 3）、增加用户接口
- rest接口：**v1/rest/addUser**
- 请求类别：post
- 请求参数：
``` json
{
    "userName":"Sally",
    "userPwd":"xxxxx"
}
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "userId":24491,
            "userName":"Sally"
        }
    ]
}
```

#### 4）、商品信息查询接口
- rest接口：**v1/rest/queryGoodsDetail**
- 请求类别：get
- 请求参数：
``` text
    goodsId:1
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "goodsCount":"9988",
            "goodsDescribe":"none",
            "goodsId":1,
            "goodsName":"Milk",
            "goodsPicturePath":"xxxx",
            "goodsPrice":2,
            "goodsType":"Normal"
        }
    ]
}
```
#### 5）、商品列表查询接口
- rest接口：**v1/rest/queryGoodsList**
- 请求类别：get
- 请求参数：
``` text
    goodsType:Normal #Param:Normal or RushToBuy
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "goodsId":1,
            "goodsName":"Milk",
            "goodsPicturePath":"xxxx",
            "goodsPrice":2
        },
        {
            "goodsId":2,
            "goodsName":"Apple",
            "goodsPicturePath":"xxxx",
            "goodsPrice":2
        },
        {
            "goodsId":3,
            "goodsName":"Banana",
            "goodsPicturePath":"xxxx",
            "goodsPrice":2
        }
    ]
}
```
#### 6）、订单列表查询接口
- rest接口：**v1/rest/queryOrdersList**
- 请求类别：post
- 请求参数：
``` json
{
    "userId":"24491"
}
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "goodsId":2,
            "goodsName":"Apple",
            "goodsPicturePath":"xxxx",
            "goodsPrice":2,
            "ordersDate":"2018-08-15 02:25:14",
            "ordersId":21
        },
        {
            "goodsId":1,
            "goodsName":"Milk",
            "goodsPicturePath":"xxxx",
            "goodsPrice":2,
            "ordersDate":"2018-08-15 02:25:04",
            "ordersId":20
        }
    ]
}
```
#### 7）、支付接口
- rest接口：**v1/rest/pay**
- 请求类别：post
- 请求参数：
``` json
{
    "userId":"1",
    "goodsId":"1",
    "goodsPrice":"2"
}
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":"PaySuccess"
}
```
#### 8）、申请付款接口
- rest接口：**v1/rest/payPendingPayment**
- 请求类别：post
- 请求参数：
``` json
{   
    "pendingPaymentId":"218",
    "userId":"24491",
    "goodsId":"5",
    "goodsPrice":"2"
}
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":"PaySuccess"
}
```
#### 9）、余额查询接口
- rest接口：**v1/rest/queryBalance**
- 请求类别：post
- 请求参数：
``` json
{
    "userId":1
}
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "balance":7129
        }
    ]
}
```
#### 10）、商品库存查询接口
- rest接口：**v1/rest/queryGoodsCount**
- 请求类别：post
- 请求参数：
``` json
{
    "goodsId":"1"
}
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "goodsCount":9986
        }
    ]
}
```
### **3、rushToBuyTestScene模块**
Database Control模块错误码说明
``` text
    成功：DbService.200
    失败：DbService.400
```
#### 1）、增加测试用户接口
- rest接口：**v1/rest/addTestUser**
- 请求类别：get
- 请求参数：
``` text
    count:5
```
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "testUserCount":5
        }
    ]
}
```
#### 2）、查询测试用户接口
- rest接口：**v1/rest/queryTestUser**
- 请求类别：get
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {
            "userId":24496,
            "userName":"test15343042052010"
        },
        {
            "userId":24497,
            "userName":"test15343042052101"
        },
        {
            "userId":24498,
            "userName":"test15343042052142"
        },
        {   
            "userId":24499,
            "userName":"test15343042052193"
        }
    ]
}
```
#### 3）、查询测试用户数接口
- rest接口：**queryTestUserCount**
- 请求类别：get
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {   
            "testUserCount":11
        }
    ]
}
```
#### 4）、清除测试用户接口
- rest接口：**cleanTestUser**
- 请求类别：get
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {   
            "cleanTestUserCount":11
        }
    ]
}
```
#### 5）、查询抢购成功用户接口
- rest接口：**queryRushToBuySuccessUser**
- 请求类别：get
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[]
}
```
#### 6）、查询抢购成功数接口
- rest接口：**queryRushToBuySuccessCount**
- 请求类别：get
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {   
            "queryRushToBuySuccessCount":0
        }
    ]
}
```
#### 7）、查询测试用户ID范围接口
- rest接口：**queryTestUserIdRange**
- 请求类别：get
- 返回结果：
``` json
{
    "errCode":"DbService.200",
    "resMsg":[
        {   
            "testUserIdRange":"[24508,24512]"
        }
    ]
}
```