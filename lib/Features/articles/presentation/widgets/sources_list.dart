import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_route/Features/articles/presentation/widgets/source_item.dart';

class SourcesList extends StatefulWidget {
  const SourcesList({super.key,});
  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: SourceItem(
            source: 'widget.articles[index].source!.name!',
            isSelected: index == currentIndex,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
