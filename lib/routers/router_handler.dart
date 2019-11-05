import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:xtd_shop/pages/details_page.dart';

Handler detaildHanderl = Handler(
  handlerFunc: (BuildContext context ,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    print('index>details goodsIf id ${goodsId}');
    return DetailsPage(goodsId);
  }
);