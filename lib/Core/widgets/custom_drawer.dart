import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key, required this.categories, required this.settings,
  });

  final VoidCallback categories;
  final VoidCallback settings;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110.h,
            color: AppColors.green,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: AppStyles.textBold24.copyWith(color: AppColors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu, size: 32, color: AppColors.black,),
            title: Text('Categories', style: AppStyles.textBold24,),
            onTap: categories,
          ),
          ListTile(
            leading: const Icon(Icons.settings ,size: 32, color: AppColors.black,),
            title: Text('Settings', style: AppStyles.textBold24,),
            onTap: settings,
          ),
        ],
      ),
    );
  }
}