import 'package:flutter/material.dart';
import 'package:news_route/Core/utils/app_assets.dart';
import 'package:news_route/Core/utils/app_colors.dart';

class CategoryItemEntity {
  final String title;
  final String image;
  final Color color;

  const CategoryItemEntity(
      {required this.color, required this.title, required this.image});

  static const List<CategoryItemEntity> categories = [
    CategoryItemEntity(
        title: 'Sports', image: AppAssets.sport, color: AppColors.red),
    CategoryItemEntity(
        title: 'Technology',
        image: AppAssets.politics,
        color: AppColors.darkBlure),
    CategoryItemEntity(
        title: 'Health', image: AppAssets.health, color: AppColors.pink),
    CategoryItemEntity(
        title: 'Business', image: AppAssets.bussines, color: AppColors.brown),
    CategoryItemEntity(
        title: 'Entertainment',
        image: AppAssets.environment,
        color: AppColors.lightBlue),
    CategoryItemEntity(
        title: 'Science', image: AppAssets.science, color: AppColors.yellow),
  ];
}
