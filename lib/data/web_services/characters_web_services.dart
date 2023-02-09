import 'package:bloc_flutter/constants/Strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );


    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true,
        error: true,
        request: true,requestBody: true,  requestHeader: true));
  }

  Future<dynamic> getAllCharacters() async {
    Response response = await dio.get('character');

    try {
      print('done');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      print('error');
      return [];
    }
  }
}
