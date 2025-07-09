import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Features/articles/presentation/widgets/desc_article.dart';
import 'package:news_route/Features/articles/presentation/widgets/header_article.dart';

class ArticleDetailsViewBody extends StatelessWidget {
  const ArticleDetailsViewBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          HeaderArticle(),
          SizedBox(
            height: 16.h,
          ),
          DescArticle(),
        ],
      ),
    );
  }
}