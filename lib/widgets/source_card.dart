import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:newsrs/constants.dart';
import 'package:newsrs/widgets/settings.dart';
import 'package:newsrs/widgets/tiles/card_list_tile.dart';

class SourceCard extends StatelessWidget {
  final Uri source;

  const SourceCard({
    Key? key,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Optimize this
    Set<Uri> newSource = Set.from(DynamicSettings.of(context).sources);
    newSource.remove(source);

    return CardListTile(
      color: Theme.of(context).backgroundColor,
      title: Text(source.host),
      horizontalTitleGap: kSourceCardHGap,
      dense: true,
      leading: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: source.toString() + "/favicon.ico",
          height: kSourceCardImageSize,
          width: kSourceCardImageSize,
          placeholder: (context, _) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(
            Icons.warning_rounded,
          ),
        ),
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      trailing: IconButton(
        splashRadius: kSourceCardSplashRadius,
        color: Theme.of(context).colorScheme.error,
        onPressed: () => DynamicSettings.of(context).sources = newSource,
        icon: const Icon(Icons.delete_rounded),
      ),
    );
  }
}
