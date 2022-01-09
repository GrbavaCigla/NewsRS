import 'package:flutter/material.dart';
import 'package:newsrs/widgets/feed_scroll.dart';

import 'package:tuple/tuple.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:newsrs/api/wordpress.dart';
import 'package:newsrs/constants.dart';
import 'package:newsrs/models/article.dart';
import 'package:newsrs/widgets/error_card.dart';
import 'package:newsrs/widgets/article_card.dart';
import 'package:newsrs/screens/home/drawer.dart';
import 'package:newsrs/widgets/custom_scaffold.dart';
import 'package:newsrs/widgets/floating_app_bar.dart';
import 'package:newsrs/widgets/settings.dart';
import 'package:newsrs/widgets/theme_toggle_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: _scaffoldKey,
      drawer: const NewsRSDrawer(),
      isAppBarBottom: DynamicSettings.of(context).isAppBarBottom,
      appBar: FloatingAppBar(
        title: const Text('NewsRS'),
        centerTitle: true,
        leading: IconButton(
          splashRadius: kIconButtonSplashRadius,
          icon: const Icon(Icons.dehaze_rounded),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: const [ThemeToggleButton()],
      ),
      body: FeedScroll<Article?>(
        builder: _feedBuilder,
        future: _feedFuture,
      ),
    );
  }

  Widget _feedBuilder(BuildContext context, Article? item, int index) {
    if (item == null) {
      if (DynamicSettings.of(context).isAppBarBottom) {
        return Container();
      } else {
        return const SizedBox(
          height: kToolbarHeight + 2 * kFloatingAppBarMargin,
        );
      }
    } else {
      return ArticleCard(article: item);
    }
  }

  // TODO: Make errors work
  Future<List<Article?>> _feedFuture(int page) async {
    List<Article?> posts = (await getPostsFromSources(
      DynamicSettings.of(context).sources.toList(),
      page: page,
    ))
        .item1;

    if (page == 1) {
      posts = [null, ...posts];
    }

    return Future.value(posts);
  }
}
