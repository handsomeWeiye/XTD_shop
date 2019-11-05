import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtd_shop/routers/application.dart';


class HotGoodsWidget extends StatelessWidget {
   List hotGoodsList;

   HotGoodsWidget({Key key, this.hotGoodsList}) : super(key: key);

    Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );
  Widget _wrapList(context){
    if (hotGoodsList.length != 0) {
      List<Widget> widgetList = hotGoodsList.map((val){
        return InkWell(
          onTap: (){
            Application.router.navigateTo(context, "/details?id=${val['goodsId']}");
          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(val['goodsImage'],width: ScreenUtil().setWidth(375),),
                Text(
                  val['goodsName'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['goodsPrice']}'),
                    Text('￥${val['goodsPrice']}',
                    style: TextStyle(color: Colors.black26,decoration: TextDecoration.lineThrough),)
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
          return Wrap(
      spacing: 2,
      children: widgetList,
    );
    }else{
      return Text(' ');
    }

  }
  Widget _hotGoods(context){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(context)
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return _hotGoods(context);
  }
}

