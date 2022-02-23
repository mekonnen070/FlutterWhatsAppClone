import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color lightPrimary = Color(0xfffcfcff);
Color lightAccent = Color(0xff25D366);
Color darkAccent = Color(0xff075E54);
Color badgeColor = Colors.red;
const KappBarColor = const Color(0xFF242F3D);
const KbodyColor = const Color(0xFF0E1621);
const KmenuColor = const Color(0xFF17212B);
const Kshadow_color = Color(0x95E9EBF0);

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme;
  SharedPreferences prefs;

  ThemeData dark = ThemeData.dark().copyWith(
    backgroundColor: KbodyColor,
    cardColor: KmenuColor,
    primaryColor: darkAccent,
    secondaryHeaderColor: KappBarColor,
    canvasColor: KmenuColor,
    dialogBackgroundColor: KmenuColor,
    bottomAppBarColor: KmenuColor,
    appBarTheme: AppBarTheme(
      backgroundColor: KappBarColor,
    ),
    scaffoldBackgroundColor: KbodyColor,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: KappBarColor,
      contentTextStyle: TextStyle(fontSize: 14),
      behavior: SnackBarBehavior.floating,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccent),
  );

  ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: darkAccent,
    ),
    scaffoldBackgroundColor: Color(0xffebf1fd),
    primaryColor: new Color(0xff075E54),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: new Color(0xff25D366)),
  );

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
  notifyListeners();
}
