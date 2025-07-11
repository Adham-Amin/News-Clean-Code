import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/services/api_service.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';
import 'package:news_route/Core/widgets/custom_scaffold.dart';
import 'package:news_route/Features/search/data/data_source/local_search_data_source.dart';
import 'package:news_route/Features/search/data/repos/search_repo_impl.dart';
import 'package:news_route/Features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:news_route/Features/search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: AppStyles.textNormal22.copyWith(color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24.sp),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => SearchCubit(
          searchRepo: SearchRepoImpl(
              remoteSearchDataSource:
                  RemoteSearchDataSourceImpl(api: ApiService(Dio()))),
        ),
        child: SearchViewBody(),
      ),
    );
  }
}
