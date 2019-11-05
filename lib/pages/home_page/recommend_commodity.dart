import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtd_shop/routers/application.dart';



class RecommendCommodity extends StatelessWidget {
  final List recommendList;

  const RecommendCommodity({Key key, this.recommendList}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      child: Column(
        children: <Widget>[
          _reconmmendtitle(),
          _reconmmendcommodity(),
        ],
      ),
    );
  }
  
  Widget _reconmmendtitle(){
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5,color: Colors.black)
        )
      ),
      height: ScreenUtil().setHeight(60),
      child: Text('商品推荐',style: TextStyle(color: Colors.purple),),
    );
  }
  
  Widget _reconmmendcommodity() {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: ScreenUtil().setHeight(320),
      child: ListView.builder(
      itemCount: recommendList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
      return _item(index ,context);
     },
    ),
    );
  }

  Widget _item(index,context){
    return InkWell(
      onTap: (){
        Application.router.navigateTo( context, "/details?id=${recommendList[index]['goodsId']}");
      },
      child:  Container(

      height: ScreenUtil().setHeight(500),
      width: ScreenUtil().setWidth(250),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            width: 0.5,
            color: Colors.black
          )
        )
      ),
      child: ListView(
        children: <Widget>[
          Image.network(recommendList[index]['image'],fit: BoxFit.fitWidth,),
          Text('¥${recommendList[index]['price']}'),
          Text('¥${recommendList[index]['price']}',style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey
          ),)
        ],
      ),
    ),
    );
  }
}