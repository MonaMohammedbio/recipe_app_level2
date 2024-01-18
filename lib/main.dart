import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:overlay_kit/overlay_kit.dart';
import 'package:provider/provider.dart';

import 'package:recipe_app_level2/pages/Splash.pages.dart';
import 'package:recipe_app_level2/provider/Ads.provider.dart';
import 'package:recipe_app_level2/provider/app_auth.provider.dart';



import 'firebase_options.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // var prefrence = await SharedPreferences.getInstance();
    // GetIt.I.registerSingleton<SharedPreferences>(prefrence);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // if (PrefrencesService.prefs != null) {
    //   print(
    //       '========================= prefrences init Successfully ========================');
    // }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(

      MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>AppAuthProvider()),
        ChangeNotifierProvider(create: (context)=>AdsProvider())
      ],
        child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlayKit(
      child: MaterialApp(
      
        home:SplashPage()
      
         ),
    );


  }
}
