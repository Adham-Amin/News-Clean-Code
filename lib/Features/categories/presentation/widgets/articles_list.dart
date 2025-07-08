import 'package:flutter/material.dart';
import 'package:news_route/Features/categories/presentation/widgets/article_item.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount:4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ArticleItem(),
        ),
      ),
    );
  }
}
