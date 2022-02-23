import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/main.dart';
import 'package:flutterwhatsapp/theme_provider.dart';
import 'package:flutterwhatsapp/whatsapp_home.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScrren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: WhatsAppHome(cameras: cameras),
      duration: 5000,
      imageSize: 130,
      imageSrc: "whatsapp-logo.png",
      text: "WhatsApp",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        darkAccent,
        lightAccent,
      ],
      backgroundColor: Colors.white,
    );
  }
}
