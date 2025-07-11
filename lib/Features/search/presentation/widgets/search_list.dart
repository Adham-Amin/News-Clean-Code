import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route/Features/articles/presentation/widgets/article_item.dart';
import 'package:news_route/Features/search/presentation/manager/cubit/search_cubit.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccess) {
            if (state.articles.isEmpty) {
              return const Center(child: Text('No results found'));
            }
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 4, horizontal: 8),
                child: ArticleItem(
                  article: state.articles[index],
                ),
              ),
            );
          } else if (state is SearchFailure) {
            return Center(child: Text(state.message));
          } else if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Search for news'));
          }
        },
      ),
    );
  }
}