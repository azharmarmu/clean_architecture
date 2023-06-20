import 'package:dio/dio.dart';

class ApiClient {
  static const String baseURL = 'http://iroidtechnologies.in';

  static const String signUp = '/Shopnow/Shopnow_api/signup';
  static const String login = '/Shopnow/Shopnow_api/login';
  static const String fetchProducts = '/Fressery/Fressery_Api/products';

  final dio;

  ApiClient({required this.dio});

  Future<dynamic> request(String endPoint,
      {Map<String, dynamic>? params}) async {
    Response response = await dio.get(
      endPoint,
      queryParameters: params,
    );
    print(response.data.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      //can handle our own exception
      throw Exception();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
