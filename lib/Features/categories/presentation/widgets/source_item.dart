import 'package:flutter/material.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Core/utils/app_styles.dart';

class SourceItem extends StatelessWidget {
  const SourceItem({
    super.key,
    required this.isSelected,
    required this.onTap, required this.source,
  });

  final String source;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.green, width: 2),
          color: isSelected ? AppColors.green : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        alignment: Alignment.center,
        child: Text(
          source,
          style: AppStyles.textNormal14.copyWith(
            color: isSelected ? AppColors.white : AppColors.green,
          ),
        ),
      ),
    );
  }
}
