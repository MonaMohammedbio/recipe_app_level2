import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app_level2/pages/homepage.pages.dart';
import 'package:recipe_app_level2/pages/intro.pages.dart';
import 'package:shared_preferences/shared_preferences.dart';




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
    if (GetIt.I.get<SharedPreferences>().getBool("isLogin")??false) {
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
          Container(
            width: 400,
            height: 1900,
            child: Image(
                     fit: BoxFit.cover,
                color: Colors.black38,
              colorBlendMode: BlendMode.darken,

                image: AssetImage("images/splash.jpg")),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:EdgeInsets.fromLTRB(110, 0,0,0),

                child: Text(
                textAlign: TextAlign.center,
                    style: TextStyle(
                         fontSize: 15, color: Colors.white,fontFamily:"Hellix",fontWeight: FontWeight.w100),
                    "Cooking Done The Easy Way"),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(60, 160,0,0),
            child: Image(
              color: Colors.black12,
            colorBlendMode: BlendMode.darken,
                height: 270,
                width:270,
                image: AssetImage("images/Logo.png")),
          )
        ]),
      ),
    );
  }
}
