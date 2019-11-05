import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsPageProvide with ChangeNotifier{
  List goodsImages ;
  Map goodsDetails ;
  //判定选择的是详情还是评论
  bool isLeft = true;
  bool isRight = false;

  //切换详情还是评论的方法
  changeIsleftOrRight(String isLeftOrRight){
    if (isLeftOrRight == 'left') {
         isLeft = true;
         isRight = false;
    } else {
       isLeft = false;
         isRight = true;
    }
    notifyListeners();
  }

  //从后天获取信息
   getGoodsInfo(String id)async {
    var formdata = {'goodsId':id};
    await request('getGoodDetailById',formData: formdata).then((val){
      goodsDetails = json.decode(val.toString());
      // print(goodsDetails);
      goodsImages = goodsDetails['data']['goodsDetail'];
      print(goodsImages);
      List goodsImages1 = goodsImages.removeWhere((item)=>item==null) as List;
      print(goodsImages1);
      notifyListeners();
    });
  }
}