import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'category_page/left_category_nav.dart';
import 'package:xtd_shop/provide/category_page_provide.dart';
import 'category_page/right_category_nav.dart';
import 'category_page/category_goods.dart';


class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provide.value<CategoryPageProvide>(context).getCategory();
    Provide.value<CategoryPageProvide>(context).getFirstGoods();
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Provide<CategoryPageProvide>(builder: (context,child,val){
        return Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(categoryList:val.categoryList),
            Column(
              children: <Widget>[RightCategoryNav(),CategoryGoods()],
            )
          ],
        ),
      );
      },)
    );
  }
}