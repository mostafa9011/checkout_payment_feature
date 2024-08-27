import 'package:checkout_feature/core/utils/keys.dart';
import 'package:dio/dio.dart';

class ApiService {
  static late Dio _dio;

  // don't forget to call init in main()
  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://api.stripe.com", // declare your baseUrl
      connectTimeout: const Duration(seconds: 20), //connection timeout
      receiveTimeout: const Duration(seconds: 20), //receive timeout
      headers: {
        "Content-Type": 'application/x-www-form-urlencoded', //set content type
        "Authorization": "Bearer ${Keys.stripeSecretKey}", //set token
      },
    );
    _dio = Dio(options);
  }

  //get method.
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, String>? headers,
  }) async {
    Response response = await _dio.get(
      endPoint,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  //post method.
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    Response response = await _dio.post(
      endPoint,
      data: body,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  //update methodز
  Future<Map<String, dynamic>> update({
    required String endPoint,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    Response response = await _dio.post(
      endPoint,
      data: body,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }
}
