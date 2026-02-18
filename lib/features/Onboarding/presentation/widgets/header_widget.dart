import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class OnboardingHeaderWidget extends StatelessWidget {
  const OnboardingHeaderWidget({
    super.key,
    required this.header,
    required this.index,
  });
  final String header;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Image.asset(header),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: (index + 1) == 3
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        SizedBox(height: (index + 1) == 2 ? 35 : 15),
                        Text(
                          AppLocalizations.of(context)!.hayatCare,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: (index + 1) == 2
                                ? AppColors.mainColor
                                : Colors.white,
                          ),
                        ),
      
                        Divider(
                          color: (index + 1) == 2
                              ? (isLight ? Colors.black : Colors.white)
                              : Colors.white,
                          thickness: 1.2,
                        ),
      
                        Text(
                          AppLocalizations.of(context)!.yourSmartCompanionForBetterHealthcare,
                          style: (index + 1) == 2
                              ? Theme.of(context).textTheme.bodySmall
                              : Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.white,
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
