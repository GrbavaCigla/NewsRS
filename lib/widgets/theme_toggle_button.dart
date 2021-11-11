import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:newsrs/constants.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({Key? key}) : super(key: key);

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: kThemeToggleButtonSplashRadius,
      onPressed: () {
        AdaptiveTheme.of(context).toggleThemeMode();
        setState(() {});
      },
      icon: Icon(kThemeToggleButtonIcons[AdaptiveTheme.of(context).mode.index]),
    );
  }
}
