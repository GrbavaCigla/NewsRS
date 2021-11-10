import 'package:flutter/material.dart';

import 'package:newsrs/api/wordpress.dart';
import 'package:newsrs/constants.dart';
import 'package:newsrs/models/article.dart';
import 'package:newsrs/widgets/article_card.dart';
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

  @override
  void initState() {
    // TODO: Use mixed sources instead
    _feedFuture = getPosts('https://www.nova.rs');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const FloatingAppBar(
        title: Text('NewsRS'),
        centerTitle: true,
        actions: [ThemeToggleButton()],
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
                  0,
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
