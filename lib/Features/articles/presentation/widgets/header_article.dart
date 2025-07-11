import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';

class HeaderArticle extends StatelessWidget {
  const HeaderArticle({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.publishedAt,
  });

  final String title;
  final String imageUrl;
  final String source;
  final String publishedAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 232.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(24.sp),
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
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
          source,
          style: AppStyles.textLight13.copyWith(color: AppColors.grey),
        ),
        Text(
          title,
          style: AppStyles.textNormal14.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          publishedAt,
          style: AppStyles.textLight13
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
