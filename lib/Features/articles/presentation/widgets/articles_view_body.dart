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
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    context.read<SourcesCubit>().getSources(category: widget.category);
  }

  void _setupTabController(int length) {
    _tabController?.dispose();
    _tabController = TabController(
      length: length,
      vsync: this,
      initialIndex: currentIndex,
    );

    _tabController!.addListener(() {
      if (!_tabController!.indexIsChanging) {
        setState(() {
          currentIndex = _tabController!.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesCubit, SourcesState>(
      builder: (context, state) {
        if (state is SourcesSuccess) {
          if (_tabController == null || _tabController!.length != state.sources.length) {
            _setupTabController(state.sources.length);
          }

          return Column(
            children: [
              SizedBox(height: 16.h),
              TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.only(right: 16.w),
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabs: List.generate(
                  state.sources.length,
                  (index) => SourceItem(
                    isSelected: currentIndex == index,
                    source: state.sources[index].sourceName,
                  ),
                ),
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
    _tabController?.dispose();
    super.dispose();
  }
}
