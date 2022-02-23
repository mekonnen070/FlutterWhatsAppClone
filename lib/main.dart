import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/constants.dart';
import 'package:flutterwhatsapp/splash_screen.dart';
import 'package:flutterwhatsapp/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiredash/wiredash.dart';


List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid || Platform.isIOS) {
    cameras = await availableCameras();
  }
  SharedPreferences.getInstance().then(
    (prefs) {
      bool isDarkTheme = prefs.getBool("darkTheme") ?? true;
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkTheme)),
          ],
          child: MyApp(),
        ),
      );
    },
  );
}

// Dism /Online /Cleanup-Image /RestoreHealth
class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Wiredash(
          key: _navigatorKey,
          projectId: projectId,
          secret: secretId,
          options: WiredashOptionsData(),
          feedbackOptions: WiredashFeedbackOptions(
            collectMetaData: (metaData) => metaData
              ..userEmail = 'name@currentuser.com'
              ..custom['isPremium'] = false
              ..custom['nested'] = {'wire': 'dash'},
            askForUserEmail: true,
            labels: [
              Label(
                id: 'lbl-r65egsdf',
                title: 'Bug',
              ),
              Label(
                id: 'lbl-6543df23s',
                title: 'Improvement',
              ),
              Label(
                id: 'lbl-de3w2fds',
                title: 'UX/UI',
              ),
              Label(
                id: 'lbl-2r98yas4',
                title: 'Font',
              ),
            ],
          ),
          child: MaterialApp(
            title: "WhatsApp",
            theme: themeProvider.getTheme(),
            debugShowCheckedModeBanner: false,
            home: SplashScrren(),
          ),
        );
      },
    );
  }
}
