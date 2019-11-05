import 'package:flutter/material.dart';
import 'package:xtd_shop/service/service_method.dart';
import 'dart:async';
import 'dart:convert';






class HomePageProvider with ChangeNotifier{
  //分配homepagecontent数据
  List swiperItemList = [];
  List categoryItemData = [];
  String leaderImageUrl = '';
  String leaderPhoneNum = '';
  List recommendList = [];
  String adBannerImageUrl = '';
  List floor1 = [];

  //存储刷新的商品信息
  List goodsList = [];
  int currenPage = 1;

    Future getHomePageContent()async{
    await request('homePageContent').then((val){
    var data = json.decode(val.toString());
    swiperItemList = (data["data"]["slides"] as List).cast(); 
    categoryItemData = (data["data"]['category'] as List).cast();  
    leaderImageUrl = data["data"]['shopInfo'][0]['leaderImage'].toString();
    leaderPhoneNum = data["data"]['shopInfo'][0]['leaderPhone'].toString();
    recommendList = (data["data"]["recommend"] as List).cast();
    adBannerImageUrl = data["data"]['advertesPicture']['image'].toString();
    floor1 = (data["data"]["floor1"] as List).cast();
    notifyListeners();
    });
    }
    

  Future lodeMore(page)async{
    await request('homePageBelowContent',formData:{'page':page}).then((val){
    var data = json.decode(val.toString());
    List<Map> newGoodsList = (data['data'] as List).cast();
    goodsList.addAll(newGoodsList);});
    currenPage++;
    notifyListeners();}
}