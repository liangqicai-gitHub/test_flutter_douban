import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testdouban/generated/json/base/json_convert_content.dart';
import 'package:testdouban/models/api_response_entity.dart';

class HttpManager {

  final String _BASEURL = 'http://apis.juhe.cn';
  final int _CONNECTTIMEOUT = 5000;
  final int _RECEIVETIMEOUT = 3000;

  //单例模式
  static HttpManager _instance;
  Dio _dio;
  BaseOptions _options;

  //单例模式，只创建一次实例
  static HttpManager getInstance(){
    if(null == _instance){
      _instance = new HttpManager();
      return _instance;
    }
  }

  HttpManager(){
    _options = new BaseOptions(
        baseUrl: _BASEURL,
        //连接时间为5秒
        connectTimeout: _CONNECTTIMEOUT,
        //响应时间为3秒
        receiveTimeout: _RECEIVETIMEOUT,
        //设置请求头
        headers: {
          "resource" : "ios"
        },
        //默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
        contentType: Headers.formUrlEncodedContentType,
        //共有三种方式json,bytes(响应字节),stream（响应流）,plain
        responseType: ResponseType.json
    );

    _dio = new Dio(_options);
//    //设置Cookie
//    _dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options){
          print("在请求之前的拦截信息");
          return options;
        },
        onResponse: (Response response){
          print("在响应之前的拦截信息");
          return response;
        },
        onError: (DioError e){
          print("在错误之前的拦截信息");
          return e;
        }
    ));
  }

  Future<Response<ApiResponseEntity>> get(String url,{Map<String, dynamic> data, Options options, CancelToken cancelToken}) async {

//    Response<Map> response;
//    try{
//      response = await _dio.get<Map>(url,queryParameters: data,options: options,cancelToken: cancelToken);
//    }on DioError catch(e){
//      print('getHttp exception: $e');
//      formatError(e);
//    }

    Response<Map> response = await _dio.get<Map>(url,queryParameters: data,options: options,cancelToken: cancelToken);

    return Response<ApiResponseEntity>(
      data: JsonConvert.fromJsonAsT<ApiResponseEntity>(response.data),
      headers: response.headers,
      request: response.request,
      isRedirect: response.isRedirect,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      redirects: response.redirects,
      extra: response.extra,
    );

  }

  post(url,{params,options,cancelToken}) async{
    Response response;
    try{
      response = await _dio.post(url,queryParameters: params,options: options,cancelToken: cancelToken);
      print('postHttp response: $response');
    }on DioError catch(e){
      print('postHttp exception: $e');
      formatError(e);
    }
    return response;
  }


  //post Form请求
  postForm(url,{data,options,cancelToken}) async{
    Response response;
    try{
      response = await _dio.post(url,options: options,cancelToken: cancelToken,data: data);
      print('postHttp response: $response');
    }on DioError catch(e){
      print('postHttp exception: $e');
      formatError(e);
    }
    return response;
  }


  downLoadFile(urlPath,savePath) async{
    Response response;
    try{
      response = await _dio.download(urlPath, savePath,onReceiveProgress: (int count,int total){
        print('$count $total');
      });
      print('downLoadFile response: $response');
    }on DioError catch(e){
      print('downLoadFile exception: $e');
      formatError(e);
    }
    return response;
  }

  //取消请求
  cancleRequests(CancelToken token){
    token.cancel("cancelled");
  }

  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      print("请求取消");
    } else {
      print("未知错误");
    }
  }

}