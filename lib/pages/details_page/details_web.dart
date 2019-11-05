import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xtd_shop/provide/details_page_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
      builder: (context, child, val) {
        if (val.isLeft) {
          return 
             Container(
              // height: ScreenUtil().setHeight(50000),
               child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: val.goodsDetails['data']['goodsDetail'].length,
              itemBuilder: (BuildContext context, int index) {
              return Container(
                width: ScreenUtil().setWidth(740),
                // height: ScreenUtil().setHeight(500),
                child: Image.network(val.goodsDetails['data']['goodsDetail'][index]),
              );
             },
            ),
             );
         

        } else {
          return Text('暂时没有评论');
        }
      },
    );
  }
}
