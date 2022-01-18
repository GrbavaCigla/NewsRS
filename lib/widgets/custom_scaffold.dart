import 'package:flutter/material.dart';

import 'package:svarog/constants.dart';

class CustomScaffold extends StatelessWidget {
  final bool isAppBarBottom;
  final Key? scaffoldKey;
  final Widget? body;
  final Widget? appBar;
  final Widget? drawer;

  const CustomScaffold({
    Key? key,
    this.scaffoldKey,
    this.body,
    this.appBar,
    this.drawer,
    this.isAppBarBottom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer,
      body: SafeArea(
        child: Stack(
          alignment:
              isAppBarBottom ? Alignment.bottomCenter : Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kPageInset),
              height: MediaQuery.of(context).size.height,
              child: body ?? Container(),
            ),
            appBar ?? Container()
          ],
        ),
      ),
    );
  }
}
