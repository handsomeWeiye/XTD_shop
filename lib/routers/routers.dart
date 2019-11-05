import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';


class Routes {
  static String root = '/';
  static String detailsPage = '/details';
  static void configureRoutes(Router route){
    route.notFoundHandler  = Handler(
      handlerFunc: (BuildContext context, Map<String,List<String>> parmars){
        print('ERROr===>Route Was Not Found!!!!!');
      }
    );

    route.define(detailsPage,handler: detaildHanderl);
  }

}