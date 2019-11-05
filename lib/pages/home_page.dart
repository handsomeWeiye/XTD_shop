import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xtd_shop/provide/home_page_provide.dart';
import 'home_page/ad_banner.dart';
import 'home_page/category_grid_widget.dart';
import 'home_page/floor_content.dart';
import 'home_page/leaderphone.dart';
import 'home_page/recommend_commodity.dart';
import 'home_page/swiper_diy.dart';
import 'home_page/hot_goods_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<RefreshFooterState> _footerkey = GlobalKey<RefreshFooterState>();
    Provide.value<HomePageProvider>(context).getHomePageContent();

    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: Container(
        child: Provide<HomePageProvider>(
          builder: (context, child, val) {
            return EasyRefresh(
              refreshFooter: ClassicsFooter(key: _footerkey),
              child: ListView(
                children: <Widget>[
                  SwiperDiy(
                    swiperItemList: val.swiperItemList,
                  ),
                  CategoryGridWidget(
                    categoryItemsList: val.categoryItemData,
                  ),
                  LeaderPhone(
                    leaderImageUrl: val.leaderImageUrl,
                    leaderPhoneNum: val.leaderPhoneNum,
                  ),
                  RecommendCommodity(
                    recommendList: val.recommendList,
                  ),
                  AdBanner(
                    adBannerImageUrl: val.adBannerImageUrl,
                  ),
                  FloorContent(
                    floorContentList: val.floor1,
                  ),
                  HotGoodsWidget(hotGoodsList: val.goodsList)
                ],
              ),
              loadMore: () async {
                print('开始加载更多');
                Provide.value<HomePageProvider>(context)
                    .lodeMore(val.currenPage);
              },
            );
          },
        ),
      ),
    );
  }
}
