import 'package:flutter/material.dart';
import 'package:recipe_app_level2/pages/Register.pages.dart';
import 'package:recipe_app_level2/pages/signin..pages.dart';

class introPage extends StatefulWidget {
  const introPage({super.key});

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
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
                padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white54,
                        fontFamily: "Hellix",
                        fontWeight: FontWeight.w100),
                    "Cooking Done The Easy Way"),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(60, 170, 0, 0),
            child: Image(
                color: Colors.black12,
                colorBlendMode: BlendMode.darken,
                height: 220,
                width: 220,
                image: AssetImage("images/Logo.png")),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 580, 0, 0),
                child: SizedBox(
                  width: 285,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.deepOrange),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (contxt)=>registerPage()));
                      },
                      child: Text("Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Hellix",

                              fontWeight: FontWeight.w100))),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 25),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (contxt)=>SigninPage()));
                    },
                    child: Text(
                      "Sign in",style: TextStyle(color: Colors.white,fontFamily: "Hellix",fontWeight: FontWeight.w100),
                    )),
              )
            ],
          )
        ]),
      ),
    );
  }
}
