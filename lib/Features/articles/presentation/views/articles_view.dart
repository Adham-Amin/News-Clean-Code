import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/services/api_service.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';
import 'package:news_route/Core/widgets/custom_scaffold.dart';
import 'package:news_route/Features/articles/data/data_sources/local_articles_data_source.dart';
import 'package:news_route/Features/articles/data/data_sources/remote_articles_data_source.dart';
import 'package:news_route/Features/articles/data/repos/article_repo_impl.dart';
import 'package:news_route/Features/articles/presentation/manager/articles_cubit/articles_cubit.dart';
import 'package:news_route/Features/articles/presentation/manager/sources_cubit/sources_cubit.dart';
import 'package:news_route/Features/articles/presentation/widgets/articles_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArticlesCubit(
              articleRepo: ArticleRepoImpl(
                  remoteArticlesDataSource:
                      RemoteArticlesDataSourceImpl(api: ApiService(Dio())),
                  localArticlesDataSource: LocalArticlesDataSourceImpl())),
        ),
        BlocProvider(
          create: (context) => SourcesCubit(
              articleRepo: ArticleRepoImpl(
                  remoteArticlesDataSource:
                      RemoteArticlesDataSourceImpl(api: ApiService(Dio())),
                  localArticlesDataSource: LocalArticlesDataSourceImpl())),
        ),
      ],
      child: CustomScaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
          centerTitle: true,
          title: Text(
            category,
            style: AppStyles.textNormal22.copyWith(color: AppColors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24.sp),
            ),
          ),
        ),
        body: ArticleViewBody(
          category: category,
        ),
      ),
    );
  }
}
