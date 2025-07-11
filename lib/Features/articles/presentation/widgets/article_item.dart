import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_routes.dart';
import 'package:news_route/Core/utils/app_styles.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key, required this.article,
  });

  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          GoRouter.of(context).push(AppRouters.articlesDetails, extra: article),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 232.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: article.urlToImageArticle,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColors.red,
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Text(
            '${article.sourceModel.sourceName}*',
            style: AppStyles.textLight13.copyWith(color: AppColors.grey),
          ),
          Text(
           article.titleArticle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textNormal14.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }
}
