import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_routes.dart';
import 'package:news_route/Core/utils/app_styles.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          GoRouter.of(context).push(AppRouters.categoryDetails,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 232.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  'article.urlToImage',
                ),
              ),
            ),
          ),
          Text(
            'article.source?.name*',
            style: AppStyles.textLight13.copyWith(color: AppColors.grey),
          ),
          Text(
           'article.title',
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
