class LoginModel {
  final String user;
  final String email;
  final String password;

  static List<LoginModel> registeredUsers = [];

  LoginModel({
    required this.user,
    required this.email,
    required this.password,
  });
}