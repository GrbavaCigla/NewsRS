import 'package:flutter/material.dart';

import 'package:newsrs/constants.dart';

class CustomScaffold extends StatelessWidget {
  final bool isAppBarBottom;
  final Widget? body;
  final Widget? appBar;

  const CustomScaffold({
    Key? key,
    this.body,
    this.appBar,
    this.isAppBarBottom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment:
              isAppBarBottom ? Alignment.bottomCenter : Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kPageInset),
              child: body ?? Container(),
            ),
            appBar ?? Container()
          ],
        ),
      ),
    );
  }
}
