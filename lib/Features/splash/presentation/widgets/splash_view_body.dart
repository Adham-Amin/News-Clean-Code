import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/utils/app_assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(
            flex: 3,
          ),
          Image.asset(
            AppAssets.logo,
            width: 200.w,
          ),
          Spacer(
            flex: 2,
          ),
          Image.asset(
            AppAssets.logoRouter,
            width: 128.w,
          ),
        ],
      ),
    );
  }
}
