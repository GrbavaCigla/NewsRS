import 'package:flutter/material.dart';
import 'package:newsrs/constants.dart';

class TagChip extends StatelessWidget {
  final String tag;

  const TagChip({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kTagChipHPadding,
        vertical: kTagChipVPadding,
      ),
      margin: const EdgeInsets.all(kTagChipMargin),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(kTagChipBorderRadius),
      ),
      child: Text(
        tag,
        textScaleFactor: kTagChipTextScaleFactor,
      ),
    );
  }
}
