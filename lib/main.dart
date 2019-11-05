import 'package:flutter/material.dart';
import 'package:xtd_shop/provide/home_page_provide.dart';
import './pages/start_animation_page.dart';
import 'package:provide/provide.dart';
import 'package:fluro/fluro.dart';
import 'package:xtd_shop/routers/routers.dart';
import 'package:xtd_shop/routers/application.dart';
import 'package:xtd_shop/provide/index_page_provide.dart';
import 'provide/category_page_provide.dart';
import 'provide/details_page_provide.dart';
import 'provide/cart_page_provide.dart';

void main() {
  var provides = Providers();
  var currentIndexProvider = CurrentIndexProvider();
  var homePageProvider = HomePageProvider();
  var categoryPageProvide = CategoryPageProvide();
    var cartPageProvide = CartPageProvide();
  var detailsPageProvide = DetailsPageProvide();
  provides
    ..provide(Provider<CurrentIndexProvider>.value(currentIndexProvider))
    ..provide(Provider<CategoryPageProvide>.value(categoryPageProvide))
    ..provide(Provider<DetailsPageProvide>.value(detailsPageProvide))
    ..provide(Provider<CartPageProvide>.value(cartPageProvide))
    ..provide(Provider<HomePageProvider>.value(homePageProvider));

  runApp(ProviderNode(
    child: MyApp(),
    providers: provides,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(
        title: '鑫通达销售APP',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        theme: ThemeData.light(),
        home: StartAnimationPage());
  }
}
