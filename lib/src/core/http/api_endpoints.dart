class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Andriod
  static const String baseUrl = "http://10.0.2.2:3000/api/v1";
  // For iOS
  // static const String baseUrl = "http://localhost:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static const String verifyOtp = "$baseUrl/auth/verify-otp";
  static const String createPassword = "$baseUrl/auth/create-password";
  static const String resetPassword = "$baseUrl/auth/resetPassword";

  // ====================== User Routes ======================
  static const String fetchUserByID = "$baseUrl/user/";
  static const String updateStatus = "$baseUrl/user/status/";
  static const String updateProfileImage = "$baseUrl/user/profile-image";
  static const String addSkill = "$baseUrl/user/skill/";

  // ====================== OTP Routes ======================
  static const String verifyAccount = "$baseUrl/verify/";
  static const String sendResetOtp = "$baseUrl/verify/generateToken/";
}
