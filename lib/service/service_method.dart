import 'dart:convert';
import 'package:xtd_shop/service/service_url.dart';
import 'package:dio/dio.dart';
import 'dart:io';

Future request(url,{formData})async{
  try {
    Response response;
    Dio dio = Dio();
    // dio.interceptors.add(LogInterceptor(requestBody: true));

    if(formData == null){
      response = await dio.post(serviceUrl[url]);
    }
    else{
      response = await dio.post(serviceUrl[url],data:formData);
    }

    if (response.statusCode==200) {
      //  print(response.data);
      return response;
 
    } else {
      throw Exception('后端接口异常');
    }
  } catch (e) {
    print('error=======================================$e');
  }
}