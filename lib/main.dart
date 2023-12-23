import 'package:flutter/material.dart';
import 'package:recipe_app_level2/pages/Splash.pages.dart';
import 'package:recipe_app_level2/services/shared%20prefrences.services.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    PrefrencesService.prefs = await SharedPreferences.getInstance();

    if (PrefrencesService.prefs != null) {
      print(
          '========================= prefrences init Successfully ========================');
    }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SplashPage(),
    );
  }
}