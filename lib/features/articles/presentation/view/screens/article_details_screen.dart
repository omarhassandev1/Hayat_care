import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                'https://img.freepik.com/free-photo/view-virus-cell-microscope_23-2148847815.jpg',
                height: 240.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.h),

            Text(
              "COVID-19 Was a Top Cause of Death in 2020 and 2021, Even For Younger People",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(height: 1.2.h),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Text(
                  "Dec 22, 2025",
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[400]
                        : Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Covid-19",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 0.5),
            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "COVID-19 was one of the leading causes of death in the United States during much of the pandemic, even for younger age groups, according to a new analysis.\n\n"
                "The results, which were published July 5 in JAMA Internal Medicine Trusted Source, paint a stark picture of the toll the pandemic has had — and continues to have — on the country.\n\n"
                "On July 1, the United States was averaging 244 COVID-19 deaths per day, according to the Johns Hopkins Coronavirus Resource Center — much lower than earlier pandemic peaks of thousands of deaths per day.",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "“This is something that we would have thought was inconceivable a couple of years ago — that we would have a new disease that’s been killing people at that rate,” said Michael Stoto, PhD...",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
