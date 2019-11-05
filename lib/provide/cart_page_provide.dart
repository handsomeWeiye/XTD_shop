import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:xtd_shop/model/cartinfo.dart';


class CartPageProvide with ChangeNotifier{

  String cartString="[]";

  List<CartModel>  cartList=[];

  double allPrice = 0;
  int allGoodsCount = 0 ;

  bool isAllClick = true;

  static Object get newList => null;

  save(goodsId,goodsName,count,price,images) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cartString = preferences.getString('cartInfo');
    var temp = cartString==null?[]:json.decode(cartString.toString());
    List<Map>tempList = (temp as List).cast();
    allPrice=0; 
    allGoodsCount=0;  //把商品总数量设置为0
    var isHave =false;
    int ival = 0;
    tempList.forEach((item){
      if (item['goodsId'] ==goodsId) {
        isHave = true;
        item['count']=item['count']+1;
        cartList[ival].count++;
      } 

          if(item['isClick']){
         allPrice+= (cartList[ival].price* cartList[ival].count);
         allGoodsCount+= cartList[ival].count;
      }
    ival ++;
    }
  
    );
          if(!isHave) {
            Map<String,dynamic> newGoods = {
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':images,
        'isClick':true
      };
      tempList.add(newGoods);
      cartList.add(CartModel.fromJson(newGoods));
      } 

          allPrice+= (count * price);
      allGoodsCount+=count;
    cartString = json.encode(tempList).toString();
    print('编码之后的json数据为${cartString}');
    preferences.setString('cartInfo', cartString);
    notifyListeners();
  }

  remove()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('cartInfo');
    cartList = [];
    print('===============数据清除已经完成');
    notifyListeners();
  }

    getCartInfo() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     //获得购物车中的商品,这时候是一个字符串
     cartString=prefs.getString('cartInfo'); 
     //把cartList进行初始化，防止数据混乱 
     cartList=[];
     //判断得到的字符串是否有值，如果不判断会报错

     isAllClick = true;
     if(cartString==null){
       cartList=[];
     }else{
       List<Map> tempList= (json.decode(cartString.toString()) as List).cast();
       allPrice = 0;
       allGoodsCount = 0;
       tempList.forEach((item){
         if(item['isClick']){
           allPrice +=(item['count']*item['price']);
           allGoodsCount+=item['count'];
         }else{
           isAllClick = false;
         }
          cartList.add(new CartModel.fromJson(item));
       });

     }
      notifyListeners();
  }

  //删除单个购物车商品
  deleteOneGoods(String goodsId)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString  = prefs.getString('cartInfo');
    List<Map> tempList =(json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0 ;
    int delIndex = 0 ;
    tempList.forEach((item){
      if(item['goodsId']==goodsId){
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  //改变被选中的状态
  changeCheckState(CartModel cartitem) async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
            cartString  = prefs.getString('cartInfo');
    List<Map> tempList =(json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0 ;
    int changeIndex = 0;
    tempList.forEach((item){
      if(item['goodsId']==cartitem.goodsId){
        changeIndex = tempIndex;
      }
      tempIndex++;
    });

    tempList[changeIndex]=cartitem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }



  changeAllCheckBtnState(bool val)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  cartString  = prefs.getString('cartInfo');
  List<Map> tempList =(json.decode(cartString.toString()) as List).cast();
  List<Map> newList = [];
  tempList.forEach((item){
    var newitem = item;
    item['isClick'] = val;
    newList.add(newitem);
  });
   cartString = json.encode(newList).toString();
  prefs.setString('cartInfo', cartString);//进行持久化
  await getCartInfo();
  }

    addOrReduceAction(var cartItem, String todo )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString=prefs.getString('cartInfo'); 
    List<Map> tempList= (json.decode(cartString.toString()) as List).cast();
    int tempIndex =0;
    int changeIndex=0;
    tempList.forEach((item){
         if(item['goodsId']==cartItem.goodsId){
          changeIndex=tempIndex; 
         }
         tempIndex++;
     });
     if(todo=='add'){
       cartItem.count++;
     }else if(cartItem.count>1){
       cartItem.count--;
     }
     tempList[changeIndex]=cartItem.toJson();
     cartString= json.encode(tempList).toString();
     prefs.setString('cartInfo', cartString);//
     await getCartInfo();

  }



}
