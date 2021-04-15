import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }

  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            color: Colors.blue[600],
            textTheme: TextTheme(headline6: TextStyle(fontSize: 20)),
          ),
        );
      case ThemeType.Other:
        return ThemeData(
          backgroundColor: Colors.blueGrey[200],
          textTheme: TextTheme(
            headline3: TextStyle(color: Colors.black54),
            subtitle1: TextStyle(color: Colors.black54),
            bodyText1: TextStyle(color: Colors.black54),
          ),
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            color: Colors.blue[800],
            textTheme: TextTheme(headline6: TextStyle(color: Colors.grey[200], fontSize: 20)),
          ),
        );
      case ThemeType.Dark:
        return ThemeData(
          backgroundColor: Colors.blueGrey[700],
          textTheme: TextTheme(
            headline3: TextStyle(color: Colors.grey[300]),
            subtitle1: TextStyle(color: Colors.grey[300]),
            bodyText1: TextStyle(color: Colors.grey[300]),
          ),
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            color: Colors.blue[900],
            textTheme: TextTheme(headline6: TextStyle(color: Colors.grey[300], fontSize: 20)),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
