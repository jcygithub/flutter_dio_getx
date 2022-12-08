import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 *Created by Jcy
 *on 2022/12/6
 */
class ResponseUtil{
  ///超时时间
  static const int CONNECT_TIMEOUT = 15000;
  static const int RECEIVE_TIMEOUT = 15000;
  late Dio dio;
  static final ResponseUtil instance = ResponseUtil.init();
  factory ResponseUtil() => instance;
  ResponseUtil.init(){
    BaseOptions options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: RECEIVE_TIMEOUT,
      contentType: 'application/json',
      // Http请求头.
      headers: {
        'Accept':'*/'
      },
    );
    dio = Dio(options);
  }
  Future<Response> post(url,data)async{
    Response response = await dio.request(url, data: data,options: Options(method: 'POST'));
    return response;
  }
  Future get(url,data) async {
    url = _restfulUrl(url, data);
    Response response = await dio.request(url, options: Options(method: 'GET'));
    return response;
  }
  // del(){}
  // put(){}

  ///restful处理
  static String _restfulUrl(String url, Map? params) {
    String path = "$url?";
    if(ObjectUtil.isNotEmpty(params)){
      params!.forEach((key, value) {
        path += "$key=$value&";
      });
    }
    // restful 请求处理
    // /gysw/search/hist/:user_id        user_id=27
    // 最终生成 url 为     /gysw/search/hist/27
    //http://192.168.11.118:30071/userauth/jjsk_basicdata/getBaseDataList?size=10&current=1&type=1


    return path.substring(0,path.length-1);
  }
}