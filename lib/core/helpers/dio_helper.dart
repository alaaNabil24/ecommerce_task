import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import '../constants/constants.dart';



class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 3),

          headers: {'Content-Type': 'application/json'}
      ),
    );

    dio?.interceptors.add(PrettyDioLogger());
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',

    };

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',

    };
    return await dio!.post(
      url,
      data: body,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Authorization': '$token',
      'Content-Type': 'application/json',
    };
    return await dio!.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
     Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Authorization': '$token',
      'Content-Type': 'application/json',
    };
    return await dio!.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }
}