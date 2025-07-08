import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.green,
              ),
              enabledBorder: outBorder(),
              focusedBorder: outBorder(),
              hintText: 'Search Article',
              hintStyle:
                  AppStyles.textNormal14.copyWith(color: AppColors.green),
            ),
          ),
        ),
        // ArticlesList(),
      ],
    );
  }

  OutlineInputBorder outBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        12.sp,
      ),
      borderSide: BorderSide(
        color: AppColors.green,
        width: 2.w,
      ),
    );
  }
}
