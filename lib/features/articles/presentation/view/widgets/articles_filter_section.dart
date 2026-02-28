import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import '../../../../../core/enums/article_category_enum.dart';
import '../../cubit/articles_cubit.dart';

class ArticlesFilterSection extends StatelessWidget {
  const ArticlesFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ArticlesCubit>();

    final categories = [null, ...ArticleCategory.values];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = cubit.selectedCategory == category;

              final label = category == null ? "All" : category.displayName;

              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: FilterChip(
                  selectedColor: AppColors.mainColor,
                  showCheckmark: false,
                  labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: isSelected ? Colors.white : AppColors.mainColor,
                    fontSize: 15.sp
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                    side: BorderSide(color: AppColors.mainColor, width: 2.r),
                  ),
                  label: Text(label),
                  selected: isSelected,
                  onSelected: (_) {
                    context.read<ArticlesCubit>().loadArticles(
                      category: category,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
