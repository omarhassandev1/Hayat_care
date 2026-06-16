import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/routes/app_routes.dart';
import 'package:hayat_care/core/services/fcm_service.dart';
import 'package:hayat_care/core/theme/app_theme.dart';
import 'package:hayat_care/features/app_settings/presentation/cubit/app_settings_state.dart';
import 'package:hayat_care/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import 'core/di/injection.dart';
import 'features/app_settings/presentation/cubit/app_settings_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FCMService().init();
  await Hive.initFlutter();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<AppSettingCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<ProfileCubit>()..loadProfile(),
          ),
          BlocProvider(create: (context) => sl<LayoutCubit>(),)
        ],
        child: BlocBuilder<AppSettingCubit, AppSettingState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.getLightTheme(state.locale.languageCode),
              darkTheme: AppTheme.getDarkTheme(state.locale.languageCode),
              themeMode: state.themeMode,
              locale: state.locale,
              initialRoute: SplashScreen.routeName,
              routes: AppRoutes.routes,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}