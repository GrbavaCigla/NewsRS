import 'package:flutter/material.dart';

import 'package:svarog/constants.dart';

class DrawerSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DrawerSection({
    Key? key,
    required this.title,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(kDrawerSectionPadding),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!,
            ),
            Padding(
              padding: const EdgeInsets.all(kDrawerSectionPadding),
              child: Column(
                children: children,
              ),
            )
          ],
        ),
      ),
    );
  }
}
