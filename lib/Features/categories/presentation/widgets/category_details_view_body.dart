import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Features/categories/presentation/widgets/desc_article.dart';
import 'package:news_route/Features/categories/presentation/widgets/header_article.dart';

class CategoryDetailsViewBody extends StatelessWidget {
  const CategoryDetailsViewBody({super.key});
  
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