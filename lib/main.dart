import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:newsrs/utils/theme.dart';
import 'package:newsrs/screens/home.dart';
import 'package:newsrs/widgets/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(NewsRSApp(savedThemeMode: savedThemeMode));
}

class NewsRSApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const NewsRSApp({
    Key? key,
    this.savedThemeMode = AdaptiveThemeMode.system,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicSettings(
      child: AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (lightTheme, darkTheme) => MaterialApp(
          title: 'NewsRS',
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const HomePage(),
        ),
      ),
    );
  }
}
