import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomListView<T> extends StatelessWidget {
  final PagingController<int, T> controller;
  final Widget Function(BuildContext, T, int) builder;
  final VoidCallback? onRefresh;
  CustomListView({
    required this.controller,
    required this.builder,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, T>(
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: builder,
        firstPageProgressIndicatorBuilder: (_) => Center(
          child: CircularProgressIndicator(),
        ),
        firstPageErrorIndicatorBuilder: (_) => Column(
          children: [
            Text(controller.error),
            ElevatedButton(
              child: Text('Click to reload'),
              onPressed: this.onRefresh,
            )
          ],
        ),
      ),
    );
  }
}
