import 'package:flutter/material.dart';

import 'package:newsrs/api/wordpress.dart';
import 'package:newsrs/constants.dart';
import 'package:newsrs/models/article.dart';
import 'package:newsrs/widgets/article_card.dart';
import 'package:newsrs/widgets/custom_drawer.dart';
import 'package:newsrs/widgets/custom_scaffold.dart';
import 'package:newsrs/widgets/floating_app_bar.dart';
import 'package:newsrs/widgets/theme_toggle_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> _feedFuture;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: Use mixed sources instead
    _feedFuture = getPosts('https://www.nova.rs');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: _scaffoldKey,
      drawer: CustomDrawer(),
      isAppBarBottom: kIsAppBarBottom,
      appBar: FloatingAppBar(
        title: const Text('NewsRS'),
        centerTitle: true,
        leading: IconButton(
          splashRadius:
              kIconButtonSplashRadiusKoef * Material.defaultSplashRadius,
          icon: const Icon(Icons.dehaze_rounded),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: const [ThemeToggleButton()],
      ),
      body: FutureBuilder<List<Article>>(
        future: _feedFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: snapshot.data!
                  .map<Widget>(
                    (e) => ArticleCard(article: e),
                  )
                  .toList()
                ..insert(
                  kIsAppBarBottom ? snapshot.data!.length : 0,
                  const SizedBox(
                    height: kToolbarHeight + 2 * kFloatingAppBarMargin,
                  ),
                ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
