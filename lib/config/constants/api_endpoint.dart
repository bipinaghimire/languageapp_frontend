class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = "http://10.0.2.2:3000/";
  //for your andriod phone
  static const String baseUrl = "http://192.168.1.75:3000/";
  // ====================== Auth Routes ======================6
  static const String login = "api/students/login";
  static const String register = "api/students/";
  static const String getUserInfo = "api/students/:id";
  static const String logoutUser = "api/students/logout";
  // static const String updateUser = "api/students/update/:id";
  static const String deleteUser = "api/students/delete/";
  static const String imrageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "api/students/uploadImage";
  static const String logout = "api/students/logout";
}
