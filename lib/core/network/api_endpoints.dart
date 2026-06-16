class ApiEndpoints {
  ApiEndpoints._();

  // Change to your machine's LAN IP when testing on a physical device.
  // Android emulator → 10.0.2.2 maps to host localhost.
  static const String baseUrl = 'http://10.0.2.2:5013';

  // Auth
  static const String register = '/api/auth/register';
  static const String login = '/api/auth/login';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String verifyOtp = '/api/auth/verify-otp';
  static const String resetPassword = '/api/auth/reset-password';

  // Profile
  static const String profileMe = '/api/profile/me';
}
