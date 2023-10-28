import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HListBuilder<T> extends StatelessWidget {
  const HListBuilder({
    super.key,
    required this.pageingController,
    required this.itemBuilder,
    this.padding,
    this.emptyBuilder,
  });

  final PagingController<int, T> pageingController;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext)? emptyBuilder;

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>(
      padding: padding,
      pagingController: pageingController,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: itemBuilder,
        noItemsFoundIndicatorBuilder: emptyBuilder,
      ),
    );
  }
}
