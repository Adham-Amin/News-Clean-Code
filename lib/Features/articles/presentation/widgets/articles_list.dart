import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route/Features/articles/presentation/manager/articles_cubit/articles_cubit.dart';
import 'package:news_route/Features/articles/presentation/widgets/article_item.dart';

class ArticlesList extends StatefulWidget {
  const ArticlesList({
    super.key,
    required this.source,
  });
  final String source;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  void initState() {
    super.initState();
    context.read<ArticlesCubit>().getArticles(sourceId: widget.source);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesSuccess) {
          if (state.articles.isEmpty) return const Center(child: Text('No news'));
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ArticleItem(article: state.articles[index],),
            ),
          );
        } else if (state is ArticlesFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
