import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityGridView extends StatelessWidget {
  const ActivityGridView({
    super.key,
    required this.itemCount,
    required this.buttons,
  });

  final int itemCount;
  final List<Widget> buttons;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: itemCount >= 2 ? 2 : 1,
        mainAxisSpacing: 6.w,
        crossAxisSpacing: 6.h,
        childAspectRatio: itemCount >= 2 ? 173 / 45 : 353 / 52,
      ),
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => buttons[index],
    );
  }
}
