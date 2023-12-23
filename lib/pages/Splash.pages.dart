import 'package:flutter/material.dart';
import 'package:recipe_app_level2/pages/homepage.pages.dart';
import 'package:recipe_app_level2/pages/intro.pages.dart';
import 'package:recipe_app_level2/pages/signin..pages.dart';

import '../services/shared prefrences.services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    initSplash();
    super.initState();
  }

  void initSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    if (PrefrencesService.checkUser()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
      // go to home page
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => introPage()));
      // go to Signin page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Image(
              color: Colors.black38,
            colorBlendMode: BlendMode.darken,

              image: AssetImage("images/splash.png")),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:EdgeInsets.fromLTRB(85, 0,0,0),

                child: Text(
                textAlign: TextAlign.center,
                    style: TextStyle(
                          color: Colors.white54,fontFamily:"Hellix",fontWeight: FontWeight.w100),
                    "Cooking Done The Easy Way"),
              ),
            ],
          ),

          Container(

            padding: EdgeInsets.fromLTRB(60, 170,0,0),

            child: Image(
              color: Colors.black12,
            colorBlendMode: BlendMode.darken,
                height: 220,
                width: 220,
                image: AssetImage("images/Logo.png")),
          )
        ]),
      ),
    );
  }
}
