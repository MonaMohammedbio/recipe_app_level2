import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'package:recipe_app_level2/pages/Splash.pages.dart';
import 'package:recipe_app_level2/provider/Ads.provider.dart';

import 'package:shared_preferences/shared_preferences.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    var prefrence = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<SharedPreferences>(prefrence);
    // if (PrefrencesService.prefs != null) {
    //   print(
    //       '========================= prefrences init Successfully ========================');
    // }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(

      MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>AdsProvider())],
        child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:SplashPage()

   );


  }
}
