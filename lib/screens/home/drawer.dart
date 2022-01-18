import 'package:flutter/material.dart';

import 'package:svarog/constants.dart';
import 'package:svarog/dialogs/add_source.dart';
import 'package:svarog/widgets/drawer_section.dart';
import 'package:svarog/widgets/settings.dart';
import 'package:svarog/widgets/source_card.dart';
import 'package:svarog/widgets/tiles/card_list_tile.dart';
import 'package:svarog/widgets/tiles/card_switch_tile.dart';

class SvarogDrawer extends StatelessWidget {
  const SvarogDrawer({Key? key}) : super(key: key);

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
                  title: 'Sources',
                  children: DynamicSettings.of(context)
                      .sources
                      .map<Widget>(
                        (e) => SourceCard(
                          source: e,
                          
                        ),
                      )
                      .toList()
                    ..add(
                      CardListTile(
                        leading: Icon(
                          Icons.add_rounded,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        color: Theme.of(context).colorScheme.primary,
                        title: Text(
                          'Add source',
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
                  title: 'Settings',
                  children: [
                    CardSwitchListTile(
                      color: Theme.of(context).backgroundColor,
                      title: const Text('Bottom app bar'),
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
