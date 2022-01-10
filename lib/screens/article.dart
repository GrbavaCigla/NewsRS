import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:newsrs/constants.dart';
import 'package:newsrs/models/article.dart';
import 'package:newsrs/widgets/custom_scaffold.dart';
import 'package:newsrs/widgets/floating_app_bar.dart';
import 'package:newsrs/widgets/settings.dart';
import 'package:newsrs/widgets/theme_toggle_button.dart';

// TODO: Add more information
class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: FloatingAppBar(
        title: const Text('NewsRS'),
        centerTitle: true,
        scrollController: _scrollController,
        actions: const [ThemeToggleButton()],
      ),
      isAppBarBottom: DynamicSettings.of(context).isAppBarBottom,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: DynamicSettings.of(context).isAppBarBottom
                  ? kArticlePageCardTopSpacing
                  : kToolbarHeight + 2 * kFloatingAppBarMargin,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(kArticlePageCardPadding),
                child: Column(
                  children: [
                    Text(
                      article.title ?? 'Unknown title',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: kArticlePageCardPadding),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(kArticlePageImageBorderRadius),
                      child: CachedNetworkImage(
                        imageUrl: article.imageUrl.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Html(
              data: article.text,
              onLinkTap: (link, context, attributes, element) async {
                // TODO: Add some kind of error handling
                // TODO: Check if same website or website in sources
                if (link != null) {
                  if (await canLaunch(link)) {
                    launch(link);
                  }
                }
              },
            ),
            SizedBox(
              height: (kToolbarHeight + 2 * kFloatingAppBarMargin) *
                  (DynamicSettings.of(context).isAppBarBottom ? 1 : 0),
            ),
          ],
        ),
      ),
    );
  }
}
