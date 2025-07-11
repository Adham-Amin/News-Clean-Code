import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:news_route/Features/search/presentation/widgets/custom_serach_field.dart';
import 'package:news_route/Features/search/presentation/widgets/search_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          CustomSearchFiel(onChanged: (value) {
            context.read<SearchCubit>().searchArticles(q: value);
          }),
          SizedBox(height: 16.h),
          SearchList(),
        ],
      ),
    );
  }
}