import 'package:flutter/material.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedScroll<T> extends StatefulWidget {
  final Future<List<T>> Function(int page) future;
  final Widget Function(BuildContext context, T item, int index) builder;

  const FeedScroll({
    Key? key,
    required this.future,
    required this.builder,
  }) : super(key: key);

  @override
  _FeedScrollState<T> createState() => _FeedScrollState<T>();
}

class _FeedScrollState<T> extends State<FeedScroll<T>> {
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 1);

  Future<void> _fetchPage(int page) async {
    try {
      List<T> newItems = await widget.future(page);
      _pagingController.appendPage(newItems, page + 1);
    } catch (err) {
      print(err);
      _pagingController.error = err;
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: widget.builder,
      ),
    );
  }
}
