class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Andriod
  // static const String baseUrl = "http://10.0.2.2:3000/api/v1";
  // For iOS
  static const String baseUrl = "http://localhost:3000/api/v1";

  // ====================== Auth Routes ======================
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static const String verifyOtp = "$baseUrl/auth/verify-otp";
  static const String createPassword = "$baseUrl/auth/create-password";
  static const String resetPassword = "$baseUrl/auth/resetPassword";

  // ====================== User Routes ======================
  static const String fetchUserByID = "$baseUrl/user/";
  static const String updateProfileImage = "$baseUrl/user/profile-image";
  static const String addSkill = "$baseUrl/user/skill/";
  static const String userEducation = "$baseUrl/user/education";
  static const String userExperience = "$baseUrl/user/experience";
  static const String updateIntro = "$baseUrl/user/intro";

  // ====================== OTP Routes ======================
  static const String verifyAccount = "$baseUrl/verify/";
  static const String sendResetOtp = "$baseUrl/verify/generateToken/";

  // ====================== Chat Routes ======================
  static const String createConversation = "$baseUrl/conversation/";
  static const String getAllConversations = "$baseUrl/conversation/user/";
  static const String getMessages = "$baseUrl/message/";
  static const String sendMessage = "$baseUrl/message/";

  // ====================== Search Routes ======================
  static const String searchHistory = "$baseUrl/user/search-history/";
  static const String searchUser = "$baseUrl/user/name/";
  static const String searchJob = "$baseUrl/job/name/";
  static const String searchProject = "$baseUrl/project/name/";

  // ====================== Dashboard Routes ======================
  static const String getProjectUser = "$baseUrl/project/user/";

  // ====================== Project Routes ======================
  static const String project = "$baseUrl/project/";
  static const String getHiring = "$baseUrl/project/hiring/";
  static const String getActive = "$baseUrl/project/active/";
  static const String getCompleted = "$baseUrl/project/completed/";
  static const String projectById = "$baseUrl/project/";
  static const String hire = "$baseUrl/project/hire";
  static const String reject = "$baseUrl/project/reject";
  static const String finishHire = "$baseUrl/project/finish-hiring/";
}
