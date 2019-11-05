import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xtd_shop/provide/details_page_provide.dart';
import 'package:xtd_shop/provide/cart_page_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtd_shop/provide/index_page_provide.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          _chartIcon(context),
          _addChart(context),
          _shoppingNow(context)
        ],
      ),
    );
  }

  Widget _chartIcon(context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            Provide.value<CurrentIndexProvider>(context).changeCurrentIndex(2);
            Navigator.pop(context);
          },
          child: Container(
            width: ScreenUtil().setWidth(110),
            alignment: Alignment.center,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget _shoppingNow(context) {
    return InkWell(
      onTap: () async {
        await Provide.value<CartPageProvide>(context).remove();
      },
      child: Container(
        width: ScreenUtil().setWidth(320),
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          '立即购买',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _addChart(context) {
    return Provide<DetailsPageProvide>(
      builder: (context, child, val) {
        var data = val.goodsDetails['data']['goodsInfo'];
        print(data);
        var goodsId = data['goodsId'].toString();
                print(goodsId);
        var goodsName = data['goodsName'].toString();
                print(goodsName);
        var count = 1;
        var price = data['goodsPrice'].toDouble();
                print(price);
        var images = data['goodsImage'].toString();
                print(images);
        return InkWell(
          onTap: () async {
            await Provide.value<CartPageProvide>(context)
                .save(goodsId, goodsName, count, price, images);
          },
          child: Container(
            width: ScreenUtil().setWidth(320),
            alignment: Alignment.center,
            color: Colors.green,
            child: Text(
              '加入购物车',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
