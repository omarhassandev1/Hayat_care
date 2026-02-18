import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';

import '../screens/article_details_screen.dart';

class DetailedArticlesCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String category;
  final String date;

  const DetailedArticlesCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleDetailsScreen(),));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 111.w,
                height: 111.h,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => _notLoadedWidget(icon: Icon(Icons.image, color: AppColors.mainColor)),
                placeholder: (context, url) => _notLoadedWidget(icon: CircularProgressIndicator(color: AppColors.mainColor,)),

              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SizedBox(
                height: 120.h,
                child: Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _notLoadedWidget({required Widget icon}) {
    return Container(
      color: AppColors.mainColor.withValues(alpha: .1),
      child: Center(child: icon),
    );
  }
}
