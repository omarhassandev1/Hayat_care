import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/custom_secondary_button.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import '../../../Auth/presentation/view/login/screens/login_screen.dart';
import '../../data/onboarding_data.dart';
import '../widgets/onboarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String routeName = 'onboardingScreen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onBoardingData.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                return OnBoardingItem(
                  model: onBoardingData[index],
                  index: index,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Column(
              spacing: 20.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingData.length,
                    (index) => buildDot(index: index),
                  ),
                ),

                SafeArea(
                  child: Row(
                    spacing: 40,
                    children: [
                      if (currentIndex < onBoardingData.length - 1)
                        currentIndex == 0
                            ? Expanded(
                                child: TextButton(
                                  child: Text(
                                    AppLocalizations.of(context)!.skip,
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pushReplacementNamed(LoginScreen.routeName);
                                  },
                                ),
                              )
                            : CustomSecondaryButton(
                                label: AppLocalizations.of(context)!.previous,
                                onPressed: () {
                                  if (currentIndex > 0) {
                                    _controller.previousPage(
                                      duration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                },
                                backgroundColor: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                              ),
                      CustomMainButton(
                        onPressed: () {
                          if (currentIndex < onBoardingData.length - 1) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOut,
                            );
                          } else {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(LoginScreen.routeName);
                          }
                        },
                        label: currentIndex == onBoardingData.length - 1
                            ? AppLocalizations.of(context)!.loginNow
                            : AppLocalizations.of(context)!.next,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? AppColors.mainColor : Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
