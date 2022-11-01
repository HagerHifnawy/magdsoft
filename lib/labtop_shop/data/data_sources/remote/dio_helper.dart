import 'package:dio/dio.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_constants_end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          '':'',
        }
      ),
    );
  }

  static Future<Response> getData(
      {required String url,  Map<String, dynamic>? query}) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.post(url, data: body);
  }
}