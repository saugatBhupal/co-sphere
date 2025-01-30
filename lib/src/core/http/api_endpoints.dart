class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Andriod
  static const String baseUrl = "http://10.0.2.2:3000/api";
  // For iOS
  // static const String baseUrl = "http://localhost:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "$baseUrl/v1/auth/login";
  static const String register = "$baseUrl/v1/auth/register";
  static const String verifyOtp = "$baseUrl/v1/auth/verify-otp";
  static const String createPassword = "$baseUrl/v1/auth/create-password";
  static const String resetPassword = "$baseUrl/v1/auth/resetPassword";

  // ====================== User Routes ======================
  static const String fetchUserByID = "$baseUrl/user/id/";
  static const String updateStatus = "$baseUrl/user/status/";
  static const String updateUser = "$baseUrl/user/update/";

  // ====================== OTP Routes ======================
  static const String verifyAccount = "$baseUrl/verify/";
  static const String sendResetOtp = "$baseUrl/verify/generateToken/";
}
