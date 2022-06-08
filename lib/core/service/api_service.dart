import 'package:dio/dio.dart';

class ApiService {
  var base = Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));
  Future<Response?> getData(String path) async {
    try {
      return await base.get(path);
    } catch (e) {
      throw Exception(e);
    }
  }
}
