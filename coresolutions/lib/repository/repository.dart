import 'package:coresolutions/models/login_response.dart';
import 'package:coresolutions/models/natures.dart';
import 'package:dio/dio.dart';

class Repository {
  final dio = Dio();

  Future<String> login(String email, String password) async {
    try {
      dio.options.headers["Content-Type"] = "application/json";
      dio.options.headers["Accept"] = "application/json";

      var response = await dio.post(
          'https://prueba-service.coreinvent.es/api/security/login',
          data: {
            'email': email,
            'password': password,
          });

      var rawData = response.data["data"];

      LoginResponse data =
          LoginResponse.fromMap(rawData as Map<String, dynamic>);

      return data.login.token;
    } on DioError catch (e) {
      //TODO CATCHEAR ERRORES
      throw e;
    }
  }

  Future<List<Nature>> getNatures(String token) async {
    try {
      dio.options.headers["Content-Type"] = "application/json";
      dio.options.headers["Accept"] = "application/json";
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.get(
        "https://prueba-service.coreinvent.es/api/restify/natures?page%5Bsize%5D=100",
      );

      var rawData = response.data["data"] as List<dynamic>;

      List<Nature> data = Nature.fromMapList(rawData);

      return data;
    } on DioError catch (e) {
      //TODO CATCHEAR ERRORES
      throw e;
    }
  }
}
