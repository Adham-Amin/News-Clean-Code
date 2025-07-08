import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_route/Core/utils/app_routes.dart';
import 'package:news_route/Core/widgets/custom_scaffold.dart';
import 'package:news_route/Features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const SplashViewBody(),
    );
  }

    void navigateToHome() {
    Timer(
      Duration(seconds: 3),
      () {
        GoRouter.of(context).pushReplacement(AppRouters.home);
      },
    );
  }
}
