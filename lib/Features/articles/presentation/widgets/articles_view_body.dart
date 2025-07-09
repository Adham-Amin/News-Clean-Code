import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Features/articles/presentation/widgets/articles_list.dart';
import 'package:news_route/Features/articles/presentation/widgets/sources_list.dart';

class ArticleViewBody extends StatefulWidget {
  const ArticleViewBody({super.key, required this.category});
  final String category;

  @override
  State<ArticleViewBody> createState() => _ArticleViewBodyState();
}

class _ArticleViewBodyState extends State<ArticleViewBody> {
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
