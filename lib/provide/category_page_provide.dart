import 'package:flutter/material.dart';
import 'package:xtd_shop/service/service_method.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryPageProvide with ChangeNotifier{
  //获取categoryGoodsList的三个参数
  int categoryId = 1;
  int subCategoryId =null;
  int page = 1;

  //分配CategoryPage数据
  List categoryList = [];

  //改变商品列表查询所需要的参数
  changeCategoryId(id){
    categoryId = id;
    notifyListeners();
  }

    changeSubCategoryId(id){
    subCategoryId = id;
    notifyListeners();
  }


  //左侧选项卡的索引
  int leftNavCurrentIndex = 0 ;

  changeleftNavCurrentIndex(index){
    leftNavCurrentIndex = index;
    notifyListeners();
  }
  //右侧选项卡的索引
  int rightNavCurrentIndex = 0 ;

  changeRightNavCurrentIndex(index){
    rightNavCurrentIndex = index;
    notifyListeners();
  }

  //右侧index归零
    changeRightNavIndexToZero(){
    rightNavCurrentIndex = 0;
    notifyListeners();
  }
  

  //存储刷新的商品信息
  List categorygoodsList = [];

  //获取分类信息的方法

    Future getCategory()async{
    await request('getCategory').then((val){
    var data = json.decode(val.toString());
    categoryList = (data["data"] as List).cast(); 
    notifyListeners();
    });
    }

  //获取更多商品的方法
  increamPage(){
        page++;
        notifyListeners();
  }

  Future lodeMore()async{
        page++;
  
        var formdata = {
      'categoryId':  categoryId,
      'subCategoryId': subCategoryId,
      'page': page
    };

    await request('getCategoryGoods',formData:formdata).then((val){
    var data = json.decode(val.toString());
    List<Map> newGoodsList = (data['data'] as List).cast();
    if(newGoodsList.length==0){
      Fluttertoast.showToast(msg: '没有更多数据喽');
    }
    categorygoodsList.addAll(newGoodsList);});

    notifyListeners();}

  Future getFirstGoods()async{
    page = 1;
  
        var formdata = {
      'categoryId':  categoryId,
      'subCategoryId': subCategoryId,
      'page': 1
    };

    await request('getCategoryGoods',formData:formdata).then((val){
    var data = json.decode(val.toString());
    List<Map> newGoodsList = (data['data'] as List).cast();
    categorygoodsList = newGoodsList;});
    notifyListeners();}


}