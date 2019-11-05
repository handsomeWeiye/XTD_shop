import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtd_shop/provide/category_page_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:xtd_shop/routers/application.dart';


class CategoryGoods extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

      GlobalKey<RefreshFooterState> _footerkey = GlobalKey<RefreshFooterState>();
    return Provide<CategoryPageProvide>(builder: (context,child,val){


      return Expanded(
        child:Container(
                width: ScreenUtil().setWidth(570),
                height: ScreenUtil().setHeight(1110),
          child:  EasyRefresh(
              refreshFooter: ClassicsFooter(key: _footerkey),
              child: ListView.builder(
                itemCount: val.categorygoodsList.length,
                itemBuilder: (BuildContext context, int index) {
                return _goodsWidget(val.categorygoodsList[index],context);
               },
               
              ),
              loadMore:()async{
                Provide.value<CategoryPageProvide>(context).lodeMore();
              } ,
      ),
        )
      );
    },);
  }


  Widget _goodsWidget(item,context){
        return InkWell(
      onTap: () {
      Application.router.navigateTo( context, "/details?id=${item['goodsId']}");
      },
      child: Container(
        height: ScreenUtil().setHeight(300),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black, width: 1.0))),
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(200),
              child: Image.network(item["goodsImage"]),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                width: ScreenUtil().setWidth(200),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text('${item["goodsName"]}'),
                      Text(
                        '￥${item["goodsPrice"]}',
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: ScreenUtil().setSp(26)),
                      ),
                      Text(
                        '￥${item["goodsPrice"]}',
                        style: TextStyle(
                            color: Colors.black54,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );

  }
}
