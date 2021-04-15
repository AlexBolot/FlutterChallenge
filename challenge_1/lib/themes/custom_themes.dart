import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) => CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  // todo(you) These colors are dreary! Modify this so the picture has different values for light and dark modes.
  //  If you are feeling ambitions, get creative and make a third theme (or a fourth!)
  CustomWidgetThemes._(BuildContext context) {
    final themeType = Provider.of<MyTheme>(context).themeType;

    switch (themeType) {
      case ThemeType.Light:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.lightBlue[100]!,
          mountainFillColor: Colors.blueGrey[200]!,
          waterFillColor: Colors.blueGrey[300]!,
          drawMoon: false,
          drawSun: true,
          drawEveningSun: false,
        );
        break;
      case ThemeType.Other:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Color.alphaBlend(Colors.orange[200]!.withAlpha(150), Colors.red[100]!),
          mountainFillColor: Colors.blueGrey,
          waterFillColor: Colors.blueGrey[600]!,
          drawMoon: false,
          drawSun: false,
          drawEveningSun: true,
        );
        break;
      case ThemeType.Dark:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.grey[850]!,
          mountainFillColor: Colors.blueGrey[700]!,
          waterFillColor: Colors.blueGrey[800]!,
          drawMoon: true,
          drawSun: false,
          drawEveningSun: false,
        );
        break;
    }
  }
}
