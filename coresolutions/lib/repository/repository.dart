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

      if (response.data["success"] == false) {
        throw Exception(response.data["message"]);
      }

      LoginResponse data =
          LoginResponse.fromMap(rawData as Map<String, dynamic>);

      return data.login.token;
    } catch (e) {
      rethrow;
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

      if (response.data["success"] == false) {
        throw Exception(response.data["message"]);
      }

      List<Nature> data = Nature.fromMapList(rawData);

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Nature> createNature(
    String code,
    String alias,
    String description,
    String token,
  ) async {
    try {
      dio.options.headers["Content-Type"] = "application/json";
      dio.options.headers["Accept"] = "application/json";
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.post(
          'https://prueba-service.coreinvent.es/api/restify/natures',
          data: {
            'code': code,
            'alias': alias,
            'description': description,
            'icon': "important_devices",
            "enabled": true,
          });

      if (response.data["success"] == false) {
        throw Exception(response.data["message"]);
      }

      var rawData = response.data["data"];

      Nature data = Nature.fromMap(rawData);

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
