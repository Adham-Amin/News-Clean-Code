import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';
import 'package:news_route/Core/widgets/custom_scaffold.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/articles/presentation/widgets/articles_details_view_body.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        centerTitle: true,
        title: Text(
          article.titleArticle.substring(0, 20),
          style: AppStyles.textNormal22.copyWith(color: AppColors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24.sp),
          ),
        ),
      ),
      body: ArticleDetailsViewBody(article: article,),
    );
  }
}
