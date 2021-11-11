import 'package:flutter/material.dart';

import 'package:newsrs/constants.dart';

class CardListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool isThreeLine = false;
  final bool? dense;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled = true;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final MouseCursor? mouseCursor;
  final bool selected = false;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool autofocus = false;
  final Color? color;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;

  const CardListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.dense,
    this.visualDensity,
    this.contentPadding,
    this.onTap,
    this.onLongPress,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        dense: dense,
        visualDensity: visualDensity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardTileBorderRadius)
        ),
        contentPadding: contentPadding,
        onTap: onTap,
        onLongPress: onLongPress,
        mouseCursor: mouseCursor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        focusNode: focusNode,
        tileColor: tileColor,
        selectedTileColor: selectedTileColor,
        enableFeedback: enableFeedback,
        horizontalTitleGap: horizontalTitleGap,
        minVerticalPadding: minVerticalPadding,
        minLeadingWidth: minLeadingWidth,
      ),
    );
  }
}
