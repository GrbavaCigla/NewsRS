import 'package:flutter/material.dart';

import 'package:newsrs/constants.dart';
import 'package:newsrs/utils/color.dart';
import 'package:newsrs/utils/swatch.dart';

var primarySwatch = generateMaterialColor(kFrostColors[3]);

var appBar = AppBarTheme(
  elevation: 1.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kFloatingAppBarBorderRadius),
  ),
);

var darkTextTheme = Typography.whiteRedmond.apply(
  displayColor: kSnowStormColors[1],
  bodyColor: kSnowStormColors[2],
);

var lightTextTheme = Typography.blackRedmond.apply(
  displayColor: kPolarNightColors[1],
  bodyColor: kPolarNightColors[3],
);

var cardTheme = CardTheme(
  margin: const EdgeInsets.all(kCardMargin),
  elevation: 1.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kCardBorderRadius),
  ),
);

var dialogTheme = DialogTheme(
    elevation: 1.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kAddSourceDialogBorderRadius)));

var buttonStyle = ButtonStyle(
  padding: MaterialStateProperty.all(kButtonPadding),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kButtonBorderRadius),
    ),
  ),
);

var elevatedButtonTheme = ElevatedButtonThemeData(style: buttonStyle);
var textButtonTheme = TextButtonThemeData(style: buttonStyle);
var outlinedButtonTheme = OutlinedButtonThemeData(style: buttonStyle);

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kPolarNightColors[0],
  backgroundColor: kPolarNightColors[2],
  canvasColor: kPolarNightColors[0],
  dialogTheme: dialogTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textButtonTheme: textButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  dialogBackgroundColor: kPolarNightColors[0],
  cardTheme: cardTheme.copyWith(
    color: kPolarNightColors[1],
  ),
  appBarTheme: appBar.copyWith(
    backgroundColor: kPolarNightColors[3],
    foregroundColor: kSnowStormColors[2],
  ),
  textTheme: darkTextTheme,
  iconTheme: IconThemeData(color: kSnowStormColors[2]),
  toggleableActiveColor: kFrostColors[1],
  primarySwatch: primarySwatch,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: kFrostColors[1],
    brightness: Brightness.dark,
    primarySwatch: primarySwatch,
    backgroundColor: kPolarNightColors[2],
    cardColor: kPolarNightColors[1],
    errorColor: kAuroraColors[0],
  ),
);

var lightTheme = ThemeData(
  scaffoldBackgroundColor: kSnowStormColors[0],
  backgroundColor: kSnowStormColors[2],
  canvasColor: kSnowStormColors[0],
  dialogTheme: dialogTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textButtonTheme: textButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  dialogBackgroundColor: kSnowStormColors[0],
  cardTheme: cardTheme.copyWith(
    color: kSnowStormColors[1],
  ),
  appBarTheme: appBar.copyWith(
    backgroundColor: kSnowStormColors[2],
    foregroundColor: kPolarNightColors[3],
  ),
  textTheme: lightTextTheme,
  iconTheme: IconThemeData(color: kPolarNightColors[2]),
  toggleableActiveColor: kFrostColors[1],
  primarySwatch: primarySwatch,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: kFrostColors[2],
    brightness: Brightness.light,
    primarySwatch: primarySwatch,
    backgroundColor: kSnowStormColors[2],
    cardColor: kSnowStormColors[1],
    errorColor: kAuroraColors[0],
  ),
);
