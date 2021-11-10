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

var cardTheme = CardTheme(
  margin: const EdgeInsets.all(kCardMargin),
  elevation: 1.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kCardBorderRadius),
  ),
);

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kPolarNightColors[0],
  cardTheme: cardTheme.copyWith(
    color: kPolarNightColors[1],
  ),
  appBarTheme: appBar.copyWith(
    backgroundColor: kPolarNightColors[3],
    foregroundColor: kSnowStormColors[2],
  ),
  textTheme: Typography.whiteRedmond.apply(
    displayColor: kSnowStormColors[1],
    bodyColor: kSnowStormColors[2],
  ),
  iconTheme: IconThemeData(color: kSnowStormColors[2]),
  primarySwatch: primarySwatch,
);

var lightTheme = ThemeData(
  scaffoldBackgroundColor: kSnowStormColors[0],
  cardTheme: cardTheme.copyWith(
    color: kSnowStormColors[1],
  ),
  appBarTheme: appBar.copyWith(
    backgroundColor: kSnowStormColors[2],
    foregroundColor: kPolarNightColors[3],
  ),
  textTheme: Typography.blackRedmond.apply(
    displayColor: kPolarNightColors[1],
    bodyColor: kPolarNightColors[3],
  ),
  iconTheme: IconThemeData(color: kPolarNightColors[2]),
  primarySwatch: primarySwatch,
);
