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

// TODO: Add colorscheme
var darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kPolarNightColors[0],
  backgroundColor: kPolarNightColors[2],
  canvasColor: kPolarNightColors[0],
  cardTheme: cardTheme.copyWith(
    color: kPolarNightColors[1],
  ),
  appBarTheme: appBar.copyWith(
    backgroundColor: kPolarNightColors[3],
    foregroundColor: kSnowStormColors[2],
  ),
  textTheme: darkTextTheme,
  iconTheme: IconThemeData(color: kSnowStormColors[2]),
  primarySwatch: primarySwatch,
);

var lightTheme = ThemeData(
  scaffoldBackgroundColor: kSnowStormColors[0],
  backgroundColor: kPolarNightColors[2],
  canvasColor: kSnowStormColors[0],
  cardTheme: cardTheme.copyWith(
    color: kSnowStormColors[1],
  ),
  appBarTheme: appBar.copyWith(
    backgroundColor: kSnowStormColors[2],
    foregroundColor: kPolarNightColors[3],
  ),
  textTheme: lightTextTheme,
  iconTheme: IconThemeData(color: kPolarNightColors[2]),
  primarySwatch: primarySwatch,
);
