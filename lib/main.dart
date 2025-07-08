import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_routes.dart';

void main() {
  runApp(const NewsRoute());
}

class NewsRoute extends StatelessWidget {
  const NewsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 870),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouters.router,
        theme: ThemeData(iconTheme: IconThemeData(color: AppColors.white)),
      ),
    );
  }
}