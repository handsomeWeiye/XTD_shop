import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDiy extends StatelessWidget {
  final List swiperItemList;
  const SwiperDiy({Key key, this.swiperItemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            '${swiperItemList[index]["image"]}',
            fit: BoxFit.cover,
          );
        },
        itemCount: swiperItemList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

