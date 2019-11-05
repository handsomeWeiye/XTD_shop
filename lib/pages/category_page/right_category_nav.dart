import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtd_shop/provide/category_page_provide.dart';
import 'package:provide/provide.dart';

class RightCategoryNav extends StatelessWidget {
  Map all = {};
   List subCategoryList = [];
   bool isClick =false;
  // const RightCategoryNav({Key key, this.subCategoryList}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(child: Provide<CategoryPageProvide>(
      builder: (context, child, val) {
        all["CategoryId"]= val.categoryList[val.leftNavCurrentIndex]["CategoryId"];
        all["subCategoryId"] = '';
        all["subCategoryName"]='全部';
        subCategoryList.add(all);
        subCategoryList.addAll(val.categoryList[val.leftNavCurrentIndex]["bxMallSubDto"]) ;
        return Container(
          width: ScreenUtil().setWidth(570),
          height: ScreenUtil().setHeight(100),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 1.0))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return _rightInKwell(
                  subCategoryList[index], index,context);
            },
          ),
        );
    

  }));}
      Widget _rightInKwell(item, index,context) {
     isClick = (index == Provide.value<CategoryPageProvide>(context).rightNavCurrentIndex)
        ? true
        : false;
    return Container(
      width: ScreenUtil().setWidth(114),
      height: ScreenUtil().setHeight(98),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.black12, width: 1.0))),
      child: InkWell(
        onTap: () {
                    Provide.value<CategoryPageProvide>(context)
              .changeRightNavCurrentIndex(index);
                           Provide.value<CategoryPageProvide>(context)
              .changeSubCategoryId(item["subCategoryId"]);
                            Provide.value<CategoryPageProvide>(context).
              getFirstGoods();


        },
        child: Center(
            child: Text(
          item["subCategoryName"],
          style: TextStyle(color: isClick ? Colors.pink : Colors.black),
        )),
      ),
    );
  }

}

