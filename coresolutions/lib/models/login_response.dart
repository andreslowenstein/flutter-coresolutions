class LoginResponse {
  LoginResponse({
    required this.login,
  });

  final Login login;

  LoginResponse.fromMap(Map<String, dynamic> x)
      : login = Login.fromMap(x["login"]);
}

class Login {
  Login({required this.token});

  final String token;

  Login.fromMap(Map<String, dynamic> x) : token = x["token"];
}
