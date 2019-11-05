import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtd_shop/model/cartinfo.dart';
import 'cart_count.dart';
import 'package:xtd_shop/provide/cart_page_provide.dart';
import 'package:provide/provide.dart';


class CartItem extends StatelessWidget {
  final CartModel item;
  CartItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0,color: Colors.black12)
        )
      ),
      child: Provide<CartPageProvide>(builder: (context,child,val){
        return Row(
        children: <Widget>[
           _cartCheckBt(context,item),_cartImage(),_cartGoodsName(),_cartPrice(context,item)
        ],
      );
      },)
    );
  }

  Widget _cartCheckBt(context,item){
    return Container(
      child: Checkbox(
        value: item.isClick,
        activeColor: Colors.blue,
        onChanged: (bool val){
          item.isClick = val;
          Provide.value<CartPageProvide>(context).changeCheckState(item);
        },
      ),
    );
  }


  Widget _cartImage(){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Image.network(item.images),
    );
  }
    Widget _cartGoodsName(){
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount(item),
        ],
      ),
    );
  }

  Widget _cartPrice(context,item){
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('￥${item.price}'),
          Container(
            child: InkWell(
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
              ),
              onTap: (){
                Provide.value<CartPageProvide>(context).deleteOneGoods(item.goodsId);
              },
            ),
          )
        ],
      ),
    );
  }
}