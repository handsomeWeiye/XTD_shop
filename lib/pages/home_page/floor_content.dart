import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtd_shop/routers/application.dart';


class FloorContent extends StatelessWidget {
  final List floorContentList;

  const FloorContent({Key key, this.floorContentList}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      
      child: Column(
        children: <Widget>[
          _firstRow(context),
          _secondRow(context),
        ],
      ),
    );
  }
  Widget _firstRow(context){
    return Row(
      children: <Widget>[
        _goodItem(floorContentList[0],context),
        Column(
          children: <Widget>[
            _goodItem(floorContentList[1],context),
            _goodItem(floorContentList[2],context),
          ],
        )
      ],
    );
  }
  Widget _secondRow(context){
    return Row(
      children: <Widget>[
        _goodItem(floorContentList[3],context),
      _goodItem(floorContentList[4],context),
      ],
    );
  }
  Widget _goodItem(goodItemImageUrl,context){
    return InkWell(
      onTap: (){
          Application.router.navigateTo( context, "/details?id=${goodItemImageUrl['goodsId']}");
      },
      child: Container(
        width: ScreenUtil().setWidth(360),
        child: Image.network(goodItemImageUrl['image']),
      ),
    );
  }
}
