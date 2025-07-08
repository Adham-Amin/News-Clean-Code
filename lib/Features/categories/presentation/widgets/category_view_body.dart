import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Features/categories/presentation/widgets/articles_list.dart';
import 'package:news_route/Features/categories/presentation/widgets/sources_list.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.category});
  final String category;

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  @override

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              SourcesList(),
              SizedBox(
                height: 8.h,
              ),
              ArticlesList(),
            ],
          );
  }
}
