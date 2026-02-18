import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to HayatCare'**
  String get welcome;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'re so glad to have you with us again, your trust means a lot to us.'**
  String get welcomeSubtitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'example123@gmail.com'**
  String get emailHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgetPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @createAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get started by creating an account and meet our doctors.'**
  String get createAccountSubtitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get fullNameHint;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @mobileNumberHint.
  ///
  /// In en, this message translates to:
  /// **'+21000000000'**
  String get mobileNumberHint;

  /// No description provided for @createAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountButton;

  /// No description provided for @accountCreatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Created Successfully'**
  String get accountCreatedTitle;

  /// No description provided for @accountCreatedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Your account has been created successfully.'**
  String get accountCreatedSubtitle;

  /// No description provided for @loginNow.
  ///
  /// In en, this message translates to:
  /// **'Login Now'**
  String get loginNow;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning 👋'**
  String get goodMorning;

  /// No description provided for @omarHassan.
  ///
  /// In en, this message translates to:
  /// **'Omar Hassan'**
  String get omarHassan;

  /// No description provided for @topDoctors.
  ///
  /// In en, this message translates to:
  /// **'Top Doctors'**
  String get topDoctors;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @topArticles.
  ///
  /// In en, this message translates to:
  /// **'Top Articles'**
  String get topArticles;

  /// No description provided for @nextAppointment.
  ///
  /// In en, this message translates to:
  /// **'Next Appointment'**
  String get nextAppointment;

  /// No description provided for @doctorInfo.
  ///
  /// In en, this message translates to:
  /// **'Doctor: Ahmed Nader Abdullah'**
  String get doctorInfo;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday, Nov 13'**
  String get thursday;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'9:30 - 10:30 AM'**
  String get time;

  /// No description provided for @findDoctors.
  ///
  /// In en, this message translates to:
  /// **'Find doctors with ease'**
  String get findDoctors;

  /// No description provided for @doctorSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Doctor Specialty'**
  String get doctorSpecialty;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @dentist.
  ///
  /// In en, this message translates to:
  /// **'Dentist'**
  String get dentist;

  /// No description provided for @ophda.
  ///
  /// In en, this message translates to:
  /// **'Ophthalmology'**
  String get ophda;

  /// No description provided for @nutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get nutrition;

  /// No description provided for @neuro.
  ///
  /// In en, this message translates to:
  /// **'Neurology'**
  String get neuro;

  /// No description provided for @heart.
  ///
  /// In en, this message translates to:
  /// **'Heart'**
  String get heart;

  /// No description provided for @bones.
  ///
  /// In en, this message translates to:
  /// **'Bones'**
  String get bones;

  /// No description provided for @addiction.
  ///
  /// In en, this message translates to:
  /// **'Addiction'**
  String get addiction;

  /// No description provided for @drAhmedSami.
  ///
  /// In en, this message translates to:
  /// **'Dr. Ahmed Sami'**
  String get drAhmedSami;

  /// No description provided for @cardiologists.
  ///
  /// In en, this message translates to:
  /// **'Cardiologists'**
  String get cardiologists;

  /// No description provided for @drOmarKhaled.
  ///
  /// In en, this message translates to:
  /// **'Dr. Omar Khaled'**
  String get drOmarKhaled;

  /// No description provided for @virologist.
  ///
  /// In en, this message translates to:
  /// **'Virologist'**
  String get virologist;

  /// No description provided for @patients.
  ///
  /// In en, this message translates to:
  /// **'Patients'**
  String get patients;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @ratings.
  ///
  /// In en, this message translates to:
  /// **'Ratings'**
  String get ratings;

  /// No description provided for @aboutDoctor.
  ///
  /// In en, this message translates to:
  /// **'About Doctor'**
  String get aboutDoctor;

  /// No description provided for @workingTime.
  ///
  /// In en, this message translates to:
  /// **'Working Time'**
  String get workingTime;

  /// No description provided for @aboutDoctorDescription.
  ///
  /// In en, this message translates to:
  /// **'Dr. Bellamy Nicholas is a top specialist at London Bridge Hospital in London. He has achieved several awards and recognition for his contribution and service in his field.'**
  String get aboutDoctorDescription;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @generalSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettings;

  /// No description provided for @otherSettings.
  ///
  /// In en, this message translates to:
  /// **'Other Settings'**
  String get otherSettings;

  /// No description provided for @changeEmail.
  ///
  /// In en, this message translates to:
  /// **'Change Email'**
  String get changeEmail;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @followUsOnSocialMedia.
  ///
  /// In en, this message translates to:
  /// **'Follow us on Social Media'**
  String get followUsOnSocialMedia;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @donations.
  ///
  /// In en, this message translates to:
  /// **'Donations'**
  String get donations;

  /// No description provided for @everyDonationCanSave.
  ///
  /// In en, this message translates to:
  /// **'Every donation can save a life'**
  String get everyDonationCanSave;

  /// No description provided for @saveWithDonation.
  ///
  /// In en, this message translates to:
  /// **'Save lives with your donation. Become a hero today!'**
  String get saveWithDonation;

  /// No description provided for @donateNow.
  ///
  /// In en, this message translates to:
  /// **'Donate Now'**
  String get donateNow;

  /// No description provided for @everyDropBlood.
  ///
  /// In en, this message translates to:
  /// **'Every drop of blood can save a life'**
  String get everyDropBlood;

  /// No description provided for @saveWithBloodDonation.
  ///
  /// In en, this message translates to:
  /// **'Save lives with your donation. Join the champions today!'**
  String get saveWithBloodDonation;

  /// No description provided for @oneBraveStep.
  ///
  /// In en, this message translates to:
  /// **'One brave step can save a life.'**
  String get oneBraveStep;

  /// No description provided for @saveLifeByReaching.
  ///
  /// In en, this message translates to:
  /// **'Save a life by reaching out. You are a hero.'**
  String get saveLifeByReaching;

  /// No description provided for @joinUs.
  ///
  /// In en, this message translates to:
  /// **'Join Us'**
  String get joinUs;

  /// No description provided for @addictiveCanRaise.
  ///
  /// In en, this message translates to:
  /// **'Addiction can raise the chance of health issues'**
  String get addictiveCanRaise;

  /// No description provided for @care.
  ///
  /// In en, this message translates to:
  /// **'Care'**
  String get care;

  /// No description provided for @article.
  ///
  /// In en, this message translates to:
  /// **'Article'**
  String get article;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @doctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// No description provided for @hayatCare.
  ///
  /// In en, this message translates to:
  /// **'HayatCare App'**
  String get hayatCare;

  /// No description provided for @yourSmartCompanionForBetterHealthcare.
  ///
  /// In en, this message translates to:
  /// **'Your smart companion for better healthcare'**
  String get yourSmartCompanionForBetterHealthcare;

  /// No description provided for @selectTheme.
  ///
  /// In en, this message translates to:
  /// **'Select app theme: Light or Dark mode'**
  String get selectTheme;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @myFavorites.
  ///
  /// In en, this message translates to:
  /// **'My Favorites'**
  String get myFavorites;

  /// No description provided for @onboarding_title_1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to HayatCare'**
  String get onboarding_title_1;

  /// No description provided for @onboarding_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Empowering Your Health Journey. HayatCare connects you with personalized health insights, smart tracking tools, and expert guidance to help you achieve a healthier life.'**
  String get onboarding_desc_1;

  /// No description provided for @onboarding_title_2.
  ///
  /// In en, this message translates to:
  /// **'Your Health Companion'**
  String get onboarding_title_2;

  /// No description provided for @onboarding_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Your Personalized Wellness Hub. Discover health recommendations, track your progress, and access trusted resources to support your journey toward better health.'**
  String get onboarding_desc_2;

  /// No description provided for @onboarding_title_3.
  ///
  /// In en, this message translates to:
  /// **'Unlock Your Wellness'**
  String get onboarding_title_3;

  /// No description provided for @onboarding_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Take control of your health journey by tracking your progress, setting achievable goals, and accessing expert advice tailored just for you.'**
  String get onboarding_desc_3;

  /// No description provided for @onboarding_title_4.
  ///
  /// In en, this message translates to:
  /// **'Let’s Get Started'**
  String get onboarding_title_4;

  /// No description provided for @onboarding_desc_4.
  ///
  /// In en, this message translates to:
  /// **'HayatCare is ready for you. Begin your journey toward better health with tools and care designed around your life.'**
  String get onboarding_desc_4;

  /// No description provided for @terms_agreement_part1.
  ///
  /// In en, this message translates to:
  /// **'By clicking Continue, you agree to our '**
  String get terms_agreement_part1;

  /// No description provided for @terms_of_service.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get terms_of_service;

  /// No description provided for @terms_agreement_part2.
  ///
  /// In en, this message translates to:
  /// **' and acknowledge that you have read our '**
  String get terms_agreement_part2;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy.'**
  String get privacy_policy;

  /// No description provided for @specialty_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get specialty_general;

  /// No description provided for @specialty_dentist.
  ///
  /// In en, this message translates to:
  /// **'Dentist'**
  String get specialty_dentist;

  /// No description provided for @specialty_ophda.
  ///
  /// In en, this message translates to:
  /// **'Ophthalmology'**
  String get specialty_ophda;

  /// No description provided for @specialty_nutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get specialty_nutrition;

  /// No description provided for @specialty_neuro.
  ///
  /// In en, this message translates to:
  /// **'Neurology'**
  String get specialty_neuro;

  /// No description provided for @specialty_heart.
  ///
  /// In en, this message translates to:
  /// **'Cardiology'**
  String get specialty_heart;

  /// No description provided for @specialty_bones.
  ///
  /// In en, this message translates to:
  /// **'Orthopedics'**
  String get specialty_bones;

  /// No description provided for @specialty_addiction.
  ///
  /// In en, this message translates to:
  /// **'Addiction Management'**
  String get specialty_addiction;

  /// No description provided for @forget_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forget_password_title;

  /// No description provided for @forget_password_brief.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email to reset the password'**
  String get forget_password_brief;

  /// No description provided for @email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email_label;

  /// No description provided for @reset_password_button.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password_button;

  /// No description provided for @new_password_title.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password_title;

  /// No description provided for @new_password_brief.
  ///
  /// In en, this message translates to:
  /// **'Create a new password. Ensure it differs from previous ones'**
  String get new_password_brief;

  /// No description provided for @password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password_label;

  /// No description provided for @confirm_password_label.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password_label;

  /// No description provided for @confirm_button.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm_button;

  /// No description provided for @otp_title.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get otp_title;

  /// No description provided for @otp_brief.
  ///
  /// In en, this message translates to:
  /// **'We sent a reset link to your email address.'**
  String get otp_brief;

  /// No description provided for @otp_not_received.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive any code?'**
  String get otp_not_received;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @confirmEmail.
  ///
  /// In en, this message translates to:
  /// **'Confirm Email'**
  String get confirmEmail;

  /// No description provided for @confirmAccountDeletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm account deletion?'**
  String get confirmAccountDeletion;

  /// No description provided for @articles.
  ///
  /// In en, this message translates to:
  /// **'Articles'**
  String get articles;

  /// No description provided for @trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// No description provided for @myBookmark.
  ///
  /// In en, this message translates to:
  /// **'My Bookmarks'**
  String get myBookmark;

  /// No description provided for @searchArticlesHint.
  ///
  /// In en, this message translates to:
  /// **'search for articles'**
  String get searchArticlesHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
