import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryGridWidget extends StatelessWidget {
  final List categoryItemsList;
  const CategoryGridWidget({Key key, this.categoryItemsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children : categoryItemsList.map((categoryItemDate){
          return CategoryItembuild(categoryItemData: categoryItemDate,);
        }).toList()
      ),
    );
  }
}

class CategoryItembuild extends StatelessWidget {
  final Map categoryItemData;
  const CategoryItembuild({Key key, this.categoryItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){},
        child: Column(
          children: <Widget>[
           Image.network(categoryItemData["categoryImage"],width: ScreenUtil().setWidth(100),),
           Text(categoryItemData["categoryName"],maxLines: 1)
          ],
        ),
      )
    );
  }
}


