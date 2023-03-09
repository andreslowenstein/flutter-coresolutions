import 'package:coresolutions/models/login_response.dart';
import 'package:dio/dio.dart';

class Repository {
  final dio = Dio();

// dio.options.headers["authorization"] = "token ${token}";

  Future<String> login(String email, String password) async {
    // https://prueba-service.coreinvent.es/api/security/login

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
      throw e;
    }
  }
}
