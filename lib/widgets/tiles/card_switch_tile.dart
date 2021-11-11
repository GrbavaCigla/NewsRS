import 'package:flutter/material.dart';

import 'package:newsrs/constants.dart';

class CardSwitchListTile extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  final Color? color;
  final Color? tileColor;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider<Object>? activeThumbImage;
  final ImageProvider<Object>? inactiveThumbImage;
  final Widget? title;
  final Widget? subtitle;
  final bool isThreeLine = false;
  final bool? dense;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? secondary;
  final bool selected = false;
  final bool autofocus = false;
  final ListTileControlAffinity controlAffinity =
      ListTileControlAffinity.platform;
  final Color? selectedTileColor;

  const CardSwitchListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.tileColor,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.title,
    this.subtitle,
    this.dense,
    this.contentPadding,
    this.secondary,
    this.selectedTileColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        tileColor: tileColor,
        activeColor: activeColor,
        activeTrackColor: activeTrackColor,
        inactiveThumbColor: inactiveThumbColor,
        inactiveTrackColor: inactiveTrackColor,
        activeThumbImage: activeThumbImage,
        inactiveThumbImage: inactiveThumbImage,
        title: title,
        subtitle: subtitle,
        dense: dense,
        contentPadding: contentPadding,
        secondary: secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardTileBorderRadius)
        ),
        selectedTileColor: selectedTileColor,
      ),
    );
  }
}
