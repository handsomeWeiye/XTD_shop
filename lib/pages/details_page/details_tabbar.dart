import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xtd_shop/provide/details_page_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
      builder: (context,child,val){
        return Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            children: <Widget>[
              _leftTabbar(val.isLeft, context),
              _rightTabbar(val.isRight, context)
            ],
          ),
        );
      },
    );
  }

  Widget _leftTabbar(bool isLeft,context){
    return InkWell(
      onTap: (){
        Provide.value<DetailsPageProvide>(context).changeIsleftOrRight('left');
      },
      child:  Container(
      width: ScreenUtil().setWidth(375),
      alignment: Alignment.center,
      color: isLeft?Colors.black12:Colors.white,
      child: Text(
        '详情',
        style: TextStyle(
          color: isLeft?Colors.pink:Colors.black
        ),
      ),
    ),
    );
  }
    Widget _rightTabbar(bool isRight,context){
    return InkWell(
      onTap: (){
        Provide.value<DetailsPageProvide>(context).changeIsleftOrRight('right');
      },
      child:  Container(
      width: ScreenUtil().setWidth(375),
      alignment: Alignment.center,
      color: isRight?Colors.black12:Colors.white,
      child: Text(
        '评论',
        style: TextStyle(
          color: isRight?Colors.pink:Colors.black
        ),
      ),
    ),
    );
  }

}