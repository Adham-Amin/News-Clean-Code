import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_routes.dart';
import 'package:news_route/Core/utils/app_styles.dart';
import 'package:news_route/Core/widgets/custom_drawer.dart';
import 'package:news_route/Core/widgets/custom_scaffold.dart';
import 'package:news_route/Features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        centerTitle: true,
        title: Text(
          'News App',
          style: AppStyles.textNormal22.copyWith(color: AppColors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24.sp),
          ),
        ),
      ),
      body: const HomeViewBody(),
      drawer: CustomDrawer(
        categories: () => GoRouter.of(context).pop(),
        settings: () => GoRouter.of(context).pushReplacement(AppRouters.setting),
      ),
    );
  }
}