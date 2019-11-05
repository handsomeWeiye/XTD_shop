import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xtd_shop/provide/details_page_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Provide.value<DetailsPageProvide>(context).changeIsleftOrRight('left');

    return Provide<DetailsPageProvide>(
      builder: (context,child,val){
        return Container(
          child: Column(
            children: <Widget>[
              _goodsImage(val.goodsDetails['data']['goodsInfo']['goodsImage']),
              _gooodsName(val.goodsDetails['data']['goodsInfo']['goodsName']),
              // _goodsNumber(val.goodsDetails['data']['goodsInfo']['goodsImage']),
              _goodsPrice(val.goodsDetails['data']['goodsInfo']['goodsPrice'],val.goodsDetails['data']['goodsInfo']['goodsPrice']),
              _goodsExplain()
            ],
          ),
        );
      },
    );
  }

  //商品图片
  Widget _goodsImage(url){
    return Image.network(url,width: ScreenUtil().setWidth(740),);
  }

  Widget _gooodsName(name){
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30.0)
        ),
      ),
    );


  }

  // Widget _goodsNumber(number){
  //   return Container(
  //     width: ScreenUtil().setWidth(730),
  //     padding: EdgeInsets.only(left: 15.0),
  //     child: Text(
  //       '编号${number}',
  //       style: TextStyle(
  //         color: Colors.black12
  //       ),
  //     ),
  //   );
  // }

  Widget _goodsPrice(mailprice,originprice){
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Row(
        children: <Widget>[
          Text('￥${mailprice}',style: TextStyle(color: Colors.orange,fontSize: ScreenUtil().setSp(30.0)),),
          Text('市场价￥${originprice}',style: TextStyle(color: Colors.black12,fontSize: ScreenUtil().setSp(25.0),decoration: TextDecoration.lineThrough),),
        ],
      ),
    );
  }

  Widget _goodsExplain(){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        '说明：> 急速送达 >正品保证 ',
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: ScreenUtil().setSp(30.0)
        ),
      ),
    );
  }
}