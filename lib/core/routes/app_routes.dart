import 'package:flutter/material.dart';
import 'package:hayat_care/features/Auth/presentation/view/change_email_password/change_email_screen.dart';
import 'package:hayat_care/features/Auth/presentation/view/change_email_password/change_password_screen.dart';
import 'package:hayat_care/features/Auth/presentation/view/login/screens/login_screen.dart';
import 'package:hayat_care/features/Auth/presentation/view/signup/screens/signup_screen.dart';
import 'package:hayat_care/features/Onboarding/presentation/screens/onboarding_screen.dart';
import 'package:hayat_care/features/Onboarding/presentation/screens/pick_language_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/about_us_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/contact_support_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/help_center_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/message_success_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/privacy_policy_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/settings_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/terms_of_service_screen.dart';
import 'package:hayat_care/features/articles/presentation/view/screens/articles_bookmarks_screen.dart';
import 'package:hayat_care/features/chatbot/presentation/view/screens/chatbot_screen.dart';
import 'package:hayat_care/features/family_members/presentation/view/screens/family_members_screen.dart';
import 'package:hayat_care/features/favorite_doctors/presentation/view/screens/favorite_doctors_screen.dart';
import 'package:hayat_care/features/layout/presentation/view/main_layout_view.dart';
import 'package:hayat_care/features/splash_screen/splash_screen.dart';


class AppRoutes {
  static final Map<String,WidgetBuilder> routes = {
    LoginScreen.routeName : (context) => LoginScreen(),
    SignUpScreen.routeName : (context) => SignUpScreen(),
    OnBoardingScreen.routeName : (context) => OnBoardingScreen(),
    PickLanguageScreen.routeName : (context) => PickLanguageScreen(),
    TermsOfServiceScreen.routeName : (context) => TermsOfServiceScreen(),
    PrivacyPolicyScreen.routeName : (context) => PrivacyPolicyScreen(),
    SplashScreen.routeName : (context) => SplashScreen(),
    MainLayoutView.routeName : (context) => MainLayoutView(),
    FavoriteDoctorsScreen.routeName : (context) => FavoriteDoctorsScreen(),
    SettingsScreen.routeName : (context) => SettingsScreen(),
    ChangeEmailScreen.routeName : (context) => ChangeEmailScreen(),
    ChangePasswordScreen.routeName : (context) => ChangePasswordScreen(),
    ArticlesBookmarksScreen.routeName : (context) => ArticlesBookmarksScreen(),
    FamilyMembersScreen.routeName : (context) => FamilyMembersScreen(),
    AboutUsScreen.routeName : (context) => AboutUsScreen(),
    HelpCenterScreen.routeName : (context) => HelpCenterScreen(),
    ContactSupportScreen.routeName : (context) => ContactSupportScreen(),
    MessageSuccessScreen.routeName : (context) => MessageSuccessScreen(),
    ChatbotScreen.routeName : (context) => ChatbotScreen(),
  };
}