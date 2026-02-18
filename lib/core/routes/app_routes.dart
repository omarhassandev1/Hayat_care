import 'package:flutter/material.dart';
import 'package:hayat_care/features/splash_screen/splash_screen.dart';

import '../../features/Auth/presentation/view/change_email_password/change_email_screen.dart';
import '../../features/Auth/presentation/view/change_email_password/change_password_screen.dart';
import '../../features/Auth/presentation/view/login/screens/login_screen.dart';
import '../../features/Auth/presentation/view/signup/screens/signup_screen.dart';
import '../../features/Auth/presentation/view/terms_and_conditions/screens/privacy_policy_screen.dart';
import '../../features/Auth/presentation/view/terms_and_conditions/screens/terms_of_service_screen.dart';
import '../../features/Onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/Onboarding/presentation/screens/pick_language_screen.dart';
import '../../features/articles/presentation/view/screens/articles_bookmarks_screen.dart';
import '../../features/articles/presentation/view/screens/articles_search_screen.dart';
import '../../features/favorite_doctors/presentation/view/screens/favorite_doctors_screen.dart';
import '../../features/layout/presentation/view/main_layout_view.dart';
import '../../features/app_settings/presentation/view/screens/settings_screen.dart';

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
  };
}