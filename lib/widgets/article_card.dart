import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:svarog/constants.dart';
import 'package:svarog/models/article.dart';
import 'package:svarog/screens/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticlePage(article: article),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kArticleCardPadding),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                article.imageUrl != null
                    ? Expanded(
                        flex: kArticleCardImageFlex,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              kCardBorderRadius - kCardMargin,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                article.imageUrl.toString(),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: article.imageUrl == null ? 0 : kCardMargin * 2,
                ),
                Expanded(
                  flex: kArticleCardTextFlex,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _mutedText(
                        context,
                        article.source?.toUpperCase() ?? 'UNKNOWN SOURCE',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        height: kArticleCardTextSpacing,
                      ),
                      Text(
                        article.title ?? 'Unknown title',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: kArticleCardTextSpacing,
                      ),
                      _categoriesText(context, article.categories, date: article.date),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoriesText(BuildContext context, List<String> categories,
      {DateTime? date}) {
    List<TextSpan> spans = [];
    for (var i = 0; i < categories.length * 2 - (date == null ? 1 : 0); i++) {
      spans.add(
        i % 2 == 0
            ? TextSpan(
                text: categories[i ~/ 2],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            : const TextSpan(text: kArticleCardSeparator),
      );
    }

    if (date != null) {
      spans.add(TextSpan(text: timeago.format(date)));
    }

    var widget = RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.color
                  ?.withOpacity(kArticleCardTextOpacity),
            ),
        children: spans,
      ),
    );

    return widget;
  }

  Text _mutedText(
    BuildContext context,
    String text, {
    TextStyle? style,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      style: style?.copyWith(
        fontWeight: fontWeight,
        color: Theme.of(context)
            .textTheme
            .bodyText1
            ?.color
            ?.withOpacity(kArticleCardTextOpacity),
      ),
    );
  }
}
