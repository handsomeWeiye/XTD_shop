import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xtd_shop/provide/details_page_provide.dart';
import './details_page/details_top_area.dart';
import './details_page/details_tabbar.dart';
import './details_page/details_web.dart';
import './details_page/details_bottom.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);




  @override
  Widget build(BuildContext context) {
    Provide.value<DetailsPageProvide>(context).getGoodsInfo(goodsId);
   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context);},
        ),
        title: Text('商品详细页面'),
      ),
      body: Stack(
              children: <Widget>[
                Container(
              child: ListView(
                children: <Widget>[
                  DetailsTopArea(),
                  DetailsTabbar(),
                  DetailsWeb(),
                ],
              ),
            ),
              Positioned(
                bottom: 0,
                left: 0,
                child: DetailsBottom()
              )
              ],
            )
    );
  }

}