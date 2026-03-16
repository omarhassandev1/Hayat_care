import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class MessageSuccessScreen extends StatefulWidget {
  const MessageSuccessScreen({super.key});
  static const String routeName = 'messageSuccessScreen';

  @override
  State<MessageSuccessScreen> createState() => _MessageSuccessScreenState();
}

class _MessageSuccessScreenState extends State<MessageSuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _circleController;
  late AnimationController _checkController;
  late AnimationController _contentController;

  late Animation<double> _circleScale;
  late Animation<double> _checkDraw;
  late Animation<double> _contentFade;
  late Animation<Offset> _contentSlide;

  @override
  void initState() {
    super.initState();

    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _checkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _circleScale = CurvedAnimation(
      parent: _circleController,
      curve: Curves.elasticOut,
    );
    _checkDraw = CurvedAnimation(
      parent: _checkController,
      curve: Curves.easeOut,
    );
    _contentFade = CurvedAnimation(
      parent: _contentController,
      curve: Curves.easeOut,
    );
    _contentSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(_contentController);

    // Sequence
    _circleController.forward().then((_) {
      _checkController.forward().then((_) {
        _contentController.forward();
      });
    });
  }

  @override
  void dispose() {
    _circleController.dispose();
    _checkController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onContinue() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1,),
              ScaleTransition(
                scale: _circleScale,
                child: Container(
                  width: 100.r,
                  height: 100.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainColor.withValues(alpha: 0.08),
                    border: Border.all(
                      color: AppColors.mainColor,
                      width: 2.5,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: _checkDraw,
                    child: Icon(
                      Icons.check,
                      color: AppColors.mainColor,
                      size: 36.r,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              SlideTransition(
                position: _contentSlide,
                child: FadeTransition(
                  opacity: _contentFade,
                  child: Column(
                    children: [
                      Text(
                        locale.successful,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        locale.successMessageBody,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black54,
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
              FadeTransition(
                opacity: _contentFade,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: Row(
                    children: [
                      CustomMainButton(
                        onPressed: _onContinue,
                        label: locale.continuee,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );
  }
}

