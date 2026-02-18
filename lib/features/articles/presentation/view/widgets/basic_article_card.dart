import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/article_details_screen.dart';

class BasicArticlesCard extends StatelessWidget {
  const BasicArticlesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleDetailsScreen(),));
      },
      child: SizedBox(
        width: 213.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                imageUrl:
                'https://www.chicagotribune.com/wp-content/uploads/migration/2017/08/14/LW5ZVXZM2NASZJDMHICFU3PSZE.jpg?w=535',
                height: 133.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 10.h),
              child: SizedBox(
                height: 42.h,
                child: Text(
                  'Addictive Can Raise the Chance of Health Issues'*2,
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
