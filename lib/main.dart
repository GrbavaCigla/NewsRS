import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:svarog/utils/settings.dart';

import 'package:svarog/utils/theme.dart';
import 'package:svarog/screens/home.dart';
import 'package:svarog/widgets/settings.dart';
import 'package:tuple/tuple.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Await for both at the same time
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final savedSettings = await getInitialSettings();

  print(savedSettings);

  runApp(SvarogApp(
    savedThemeMode: savedThemeMode,
    savedSettings: savedSettings,
  ));
}

class SvarogApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final Tuple2<bool, Set<Uri>> savedSettings;

  const SvarogApp({
    Key? key,
    required this.savedSettings,
    this.savedThemeMode = AdaptiveThemeMode.system,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicSettings(
      initial: savedSettings,
      child: AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (lightTheme, darkTheme) => MaterialApp(
          title: 'Svarog',
          theme: lightTheme,
          darkTheme: darkTheme,
          home: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: const HomePage(),
          ),
        ),
      ),
    );
  }
}
