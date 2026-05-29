class LoginRequestModel {
  final String username;
  final String password;
  final int expiresInMins;

  LoginRequestModel({
    required this.username,
    required this.password,
    required this.expiresInMins,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'expiresInMins': expiresInMins,
  };
}
