import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/theme_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  @override
  State<ChangeThemeButtonWidget> createState() =>
      _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    var _icon = themeProvider.getTheme() != themeProvider.dark
        ? FaIcon(
            FontAwesomeIcons.solidLightbulb,
            color: Colors.orange,
          )
        : FaIcon(
            FontAwesomeIcons.lightbulb,
            color: Colors.white,
          );

    // ? Icons.brightness_2
    // : Icons.wb_sunny;
    return IconButton(
      
      icon: _icon,
      tooltip: themeProvider.getTheme() == themeProvider.dark
          ? 'Light Mode'
          : 'Dark Mode',
      onPressed: () {
        themeProvider.swapTheme();
      },
    );
  }
}
