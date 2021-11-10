import 'package:flutter/material.dart';

import 'package:newsrs/constants.dart';
import 'package:newsrs/models/article.dart';
import 'package:newsrs/widgets/tag_chip.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                              kCardBorderRadius - kCardMargin),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(article.imageUrl.toString()),
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
                    Text(
                      article.source ?? 'Unknown source',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Wrap(
                      children: article.categories.map(
                        (e) => TagChip(
                          tag: e.toString(),
                        ),
                      ).toList(),
                    ),
                    Text(
                      article.title ?? 'Unknown title',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.author ?? 'Unknown author',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          article.date == null
                              ? ''
                              : '${article.date!.day}/${article.date!.month}/${article.date!.year}',
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
