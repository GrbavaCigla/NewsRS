import 'package:flutter/material.dart';
import 'package:newsrs/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: kCustomDrawerMargin),
        child: const ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(kBorderRadius),
            topRight: Radius.circular(kBorderRadius),
          ),
          child: Drawer(),
        ),
      ),
    );
  }
}
