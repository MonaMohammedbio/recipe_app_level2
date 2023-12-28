import 'package:flutter/material.dart';
import 'package:recipe_app_level2/pages/signin..pages.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
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
                padding: EdgeInsets.fromLTRB(150, 60, 0, 240),
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Hellix"),
                    "Register"),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(60,40, 0, 0),
            child: Image(
                color: Colors.black12,
                colorBlendMode: BlendMode.difference,
                height: 270,
                width: 270,
                image: AssetImage("images/Logo.png")),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 330, 0, 0),
            child: SizedBox(
              width: 285,
              height: 50,
              child: TextFormField(
                  style: TextStyle(color:Colors.white),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_4_outlined,
                        color: Colors.white, size: 30),
                    floatingLabelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Hellix"),
                    filled: false,
                    border: UnderlineInputBorder(),
                    labelText: "Full Name"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 395, 0, 0),
            child: SizedBox(
              width: 285,
              height: 50,
              child: TextFormField(
                style: TextStyle(color:Colors.white),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    floatingLabelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Hellix"),
                    filled: false,
                    border: UnderlineInputBorder(),
                    labelText: "Email Adress"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 460, 0, 0),
            child: SizedBox(
              width: 285,
              height: 50,
              child: TextFormField(
                style: TextStyle(color:Colors.white),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    suffixIcon: Icon(Icons.visibility_off_outlined, size:30,color: Colors.white,),
                    floatingLabelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Hellix"),
                    filled: false,
                    border: UnderlineInputBorder(),
                    labelText: "Password"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 590, 0, 0),
            child: SizedBox(
              width: 320,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.deepOrange),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contxt) => SigninPage()));
                  },
                  child: Text("Register",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "Hellix",
                          fontWeight: FontWeight.bold))),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(80, 710, 0, 0),
            child: Row(
              children: [
                Text(
                  "Already registered?",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Hellix"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contxt) => SigninPage()));
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize:16,
                          color: Colors.deepOrange,
                          fontFamily: "Hellix",
                          fontWeight: FontWeight.w100),

                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
