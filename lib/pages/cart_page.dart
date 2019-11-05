import 'package:flutter/material.dart';
import 'package:xtd_shop/provide/cart_page_provide.dart';
import 'package:provide/provide.dart';
import 'cart_page/cart_item.dart';
import './cart_page/cart_bottom.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                Provide<CartPageProvide>(
                  builder: (context, child, val) {
                    List cartList =
                        Provide.value<CartPageProvide>(context).cartList;
                    return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartItem(cartList[index]);
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: CartBottom(),
                )
              ],
            );
          } else {
            return Text('正在加载中');
          }
        },
      ),
    );
  }

  Future _getCartInfo(BuildContext context) async {
    await Provide.value<CartPageProvide>(context).getCartInfo();
    return 'end';
  }
}
