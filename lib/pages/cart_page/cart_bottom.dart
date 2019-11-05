import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:xtd_shop/provide/cart_page_provide.dart';

class CartBottom extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      child:Provide<CartPageProvide>(builder: (context,child,val){
        return  Row(
        children: <Widget>[
          _selectAllBtn(context),_allPriceArea(context),_goButton(context)
        ],
      );
      },)
    );
  }

  Widget _selectAllBtn(context){
    bool isAllClick = Provide.value<CartPageProvide>(context).isAllClick;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllClick,
            activeColor: Colors.blue,
            onChanged: (bool val){
              Provide.value<CartPageProvide>(context).changeAllCheckBtnState(val);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  Widget _allPriceArea(context){
    double allPrice = Provide.value<CartPageProvide>(context).allPrice;
    return Container(
      width: ScreenUtil().setWidth(430),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  '合计：',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                  ),
                ),
              ),
              Container(
                               alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '￥${allPrice}',
                  style:TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.red,
                  )  
              )),
            ],
          ),
                    Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10000元免配送费，预购免配送费',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(22)
              ),
            ),)
        ],
      ),
    );

  }

  Widget _goButton(context){
    int allGoodsCount = Provide.value<CartPageProvide>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text(
            '结算（${allGoodsCount}）',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}