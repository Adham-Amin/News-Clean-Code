import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';

class CustomSearchFiel extends StatelessWidget {
  const CustomSearchFiel({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: AppColors.green,
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
        hintStyle: AppStyles.textNormal14.copyWith(color: AppColors.green),
      ),
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
