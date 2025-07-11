import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/functions/launch_link.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';

class DescArticle extends StatelessWidget {
  const DescArticle({super.key, required this.description, required this.url});

  final String description; 
  final String url; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(24.sp),
        ),
        color: AppColors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
      child: Column(
        children: [
          Text(
            description,
            style: AppStyles.textLight13,
          ),
          SizedBox(
            height: 32.h,
          ),
          InkWell(
            onTap: () {
              linkLauncher(context, url);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 16.w,
              children: [
                Text(
                  'View Full Article',
                  style: AppStyles.textNormal14
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
