import 'package:flutter/material.dart';

import 'package:svarog/widgets/feed_scroll.dart';
import 'package:svarog/api/wordpress.dart';
import 'package:svarog/constants.dart';
import 'package:svarog/models/article.dart';
import 'package:svarog/widgets/article_card.dart';
import 'package:svarog/screens/home/drawer.dart';
import 'package:svarog/widgets/custom_scaffold.dart';
import 'package:svarog/widgets/floating_app_bar.dart';
import 'package:svarog/widgets/settings.dart';
import 'package:svarog/widgets/theme_toggle_button.dart';

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
      drawer: const SvarogDrawer(),
      isAppBarBottom: DynamicSettings.of(context).isAppBarBottom,
      appBar: FloatingAppBar(
        title: const Text('Svarog'),
        centerTitle: true,
        leading: IconButton(
          splashRadius: kIconButtonSplashRadius,
          icon: const Icon(Icons.dehaze_rounded),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: const [ThemeToggleButton()],
      ),
      body: FeedScroll<Article?>(
        edgeOffset: DynamicSettings.of(context).isAppBarBottom
            ? 0
            : kToolbarHeight + kFloatingAppBarMargin,
        builder: _feedBuilder,
        future: _feedFuture,
      ),
    );
  }

  Widget _feedBuilder(BuildContext context, Article? item, int index) {
    if (item == null) {
      return SizedBox(
        height: DynamicSettings.of(context).isAppBarBottom
            ? 0
            : kToolbarHeight + 2 * kFloatingAppBarMargin,
      );
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
