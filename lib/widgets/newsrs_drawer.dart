import 'package:flutter/material.dart';

import 'package:newsrs/constants.dart';
import 'package:newsrs/dialogs/add_source.dart';
import 'package:newsrs/widgets/drawer_section.dart';
import 'package:newsrs/widgets/settings.dart';
import 'package:newsrs/widgets/source_card.dart';
import 'package:newsrs/widgets/tiles/card_list_tile.dart';
import 'package:newsrs/widgets/tiles/card_switch_tile.dart';

class NewsRSDrawer extends StatelessWidget {
  const NewsRSDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: kCustomDrawerMargin),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(kBorderRadius),
            topRight: Radius.circular(kBorderRadius),
          ),
          child: Drawer(
            child: ListView(
              children: [
                DrawerSection(
                  title: "Sources",
                  children: DynamicSettings.of(context)
                      .sources
                      .map<Widget>((e) => SourceCard(source: e))
                      .toList()
                    ..add(
                      CardListTile(
                        leading: Icon(
                          Icons.add_rounded,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        color: Theme.of(context).colorScheme.primary,
                        title: Text(
                          "Add source",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => const AddSourceDialog(),
                        ),
                      ),
                    ),
                ),
                DrawerSection(
                  title: "Settings",
                  children: [
                    CardSwitchListTile(
                      color: Theme.of(context).backgroundColor,
                      title: const Text("Bottom app bar"),
                      value: DynamicSettings.of(context).isAppBarBottom,
                      onChanged: (value) =>
                          DynamicSettings.of(context).isAppBarBottom = value,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
