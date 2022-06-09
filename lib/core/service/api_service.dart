import 'package:dio/dio.dart';
import 'package:path_task/core/core_shelf.dart';

class ApiService {
  var base = Dio(BaseOptions(baseUrl: GlobalVars.serviceConst.baseUrl));
  Future<Response?> getData(String path) async {
    try {
      return await base.get(path);
    } catch (e) {
      throw Exception(e);
    }
  }
}
