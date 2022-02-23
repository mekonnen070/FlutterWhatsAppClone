// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/ChangeThemeToggleButton.dart';
import 'package:flutterwhatsapp/models/chat_model.dart';
import 'package:flutterwhatsapp/rating_dialog.dart';
import 'package:flutterwhatsapp/theme_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wiredash/wiredash.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView(
              controller: ScrollController(),
              shrinkWrap: true,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: themeProvider.getTheme() == themeProvider.light
                        ? darkAccent
                        : KappBarColor,
                  ),
                  accountName: Text('current User'),
                  accountEmail: Text('+215787877'),
                  currentAccountPicture: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(dummyImageLink),
                    ),
                  ),
                  // otherAccountsPictures: [
                  //   ChangeThemeButtonWidget(),
                  // ],
                ),
                ListTile(
                  leading: themeProvider.getTheme() != themeProvider.dark
                      ? FaIcon(
                          FontAwesomeIcons.solidLightbulb,
                          color: Colors.orange,
                        )
                      : FaIcon(
                          FontAwesomeIcons.lightbulb,
                          color: Colors.grey,
                        ),
                  title: Text(
                    'Night Mode',
                  ),
                  onTap: () {
                    themeProvider.swapTheme();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.feedback_outlined,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Send Feedback',
                  ),
                  onTap: () =>
                      Wiredash.of(context).show(inheritMaterialTheme: true),
                ),
                ListTile(
                  leading: Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Rate the App',
                  ),
                  onTap: () {
                    showRatingDialog(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xff25D366),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => Welcome()));
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
