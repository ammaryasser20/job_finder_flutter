import 'package:dio/dio.dart';
import 'package:gp/const.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      validateStatus: (_) => true,
      headers: {"Accept": 'application/json'},
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};
      final Response response =
          await dio.get(url, queryParameters: queryParameters, data: data);

      return response;
    } catch (e) {
      print(e);
    }
  }
  static Future<dynamic> postDataAndFiles({
    required String url,
    Map<String, dynamic>? queryParameters,
    required FormData data,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};

      final Response response =
          await dio.post(url, data: data);

      return response;
    } catch (error) {
      print(error);
    }
  }
  static Future<dynamic> postData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};

      final Response response =
          await dio.post(url, queryParameters: queryParameters, data: data);

      return response;
    } catch (error) {
      print(error);
    }
  }

  static deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};
      final Response response =
          await dio.delete(url, queryParameters: queryParameters, data: data);

      return response;
    } catch (error) {
      print(error);
    }
  }

  static putData(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      String? token}) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};
      final Response response =
          await dio.put(url, queryParameters: queryParameters, data: data);

      return response;
    } catch (e) {
      print(e);
    }
  }
}
