import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtd_shop/provide/category_page_provide.dart';
import 'package:provide/provide.dart';

class LeftCategoryNav extends StatelessWidget {
  final List categoryList;
  const LeftCategoryNav({Key key, this.categoryList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftInkwel(index, context);
        },
      ),
    );
  }

  Widget _leftInkwel(int index, context) {
    return Provide<CategoryPageProvide>(builder: (context, child, val) {
      bool isClick = (index == val.leftNavCurrentIndex) ? true : false;
      return InkWell(
        onTap: () {
          Provide.value<CategoryPageProvide>(context)
              .changeleftNavCurrentIndex(index);
                    Provide.value<CategoryPageProvide>(context)
              .changeRightNavIndexToZero();
               Provide.value<CategoryPageProvide>(context)
              .changeCategoryId(categoryList[index]["CategoryId"]);
                             Provide.value<CategoryPageProvide>(context)
              .changeSubCategoryId(null);
              // print(categoryList[index]["CategoryId"]);
              Provide.value<CategoryPageProvide>(context).
              getFirstGoods();
        },
        child: Container(
          height: ScreenUtil().setHeight(100),
          padding: EdgeInsets.only(left: 10, top: 20),
          decoration: BoxDecoration(
              color:isClick?Colors.black12 : Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Text(
            categoryList[index]["CategoryName"],
            style: TextStyle(fontSize: ScreenUtil().setSp(28)),
          ),
        ),
      );
    });
  }
}
