import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Core/utils/app_colors.dart';
import 'package:news_route/Features/articles/presentation/manager/sources_cubit/sources_cubit.dart';
import 'package:news_route/Features/articles/presentation/widgets/articles_list.dart';
import 'package:news_route/Features/articles/presentation/widgets/source_item.dart';

class ArticleViewBody extends StatefulWidget {
  const ArticleViewBody({super.key, required this.category});
  final String category;

  @override
  State<ArticleViewBody> createState() => _ArticleViewBodyState();
}

class _ArticleViewBodyState extends State<ArticleViewBody>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<SourcesCubit>().getSources(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesCubit, SourcesState>(
      builder: (context, state) {
        if (state is SourcesSuccess) {
          _tabController = TabController(
            length: state.sources.length,
            vsync: this,
            initialIndex: currentIndex,
          );
          _tabController.addListener(() {
            if (_tabController.indexIsChanging == false) {
              setState(() {
                currentIndex = _tabController.index;
              });
            }
          });

          return Column(
            children: [
              SizedBox(height: 16.h),
              TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.only(right: 16.w),
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabs: state.sources
                    .map((e) => SourceItem(
                          isSelected: currentIndex == state.sources.indexOf(e),
                          source: e.sourceName,
                        ))
                    .toList(),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: state.sources
                      .map((e) => ArticlesList(source: e.sourceId))
                      .toList(),
                ),
              ),
            ],
          );
        } else if (state is SourcesFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.green),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
