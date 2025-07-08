import 'package:go_router/go_router.dart';
import 'package:news_route/Features/categories/presentation/views/category_details_view.dart';
import 'package:news_route/Features/categories/presentation/views/category_view.dart';
import 'package:news_route/Features/home/presentation/views/home_view.dart';
import 'package:news_route/Features/search/presentation/views/search_view.dart';
import 'package:news_route/Features/setting/presentation/views/setting_view.dart';
import 'package:news_route/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouters {
  static const String home = '/home';
  static const String setting = '/setting';
  static const String category = '/category';
  static const String categoryDetails = '/categoryDetails';
  static const String search = '/search';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: setting,
        builder: (context, state) => const SettingView(),
      ),
      GoRoute(
        path: category,
        builder: (context, state) => CategoryView(category: state.extra as String,),
      ),
      GoRoute(
        path: categoryDetails,
        builder: (context, state) => CategoryDetailsView(
        ),
      ),
      GoRoute(
        path: search,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}