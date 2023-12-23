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
          Image(
              color: Colors.black38,
              colorBlendMode: BlendMode.darken,
              image: AssetImage("images/splash.png")),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(130, 0, 0, 240),
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Hellix"),
                    "Register"),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(70, 70, 0, 0),
            child: Image(
                color: Colors.black12,
                colorBlendMode: BlendMode.difference,
                height: 200,
                width: 200,
                image: AssetImage("images/Logo.png")),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 300, 0, 0),
            child: SizedBox(
              width: 285,
              height: 50,
              child: TextFormField(
                  style: TextStyle(color:Colors.white70),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_4_outlined,
                        color: Colors.white70, size: 20),
                    floatingLabelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontFamily: "Hellix"),
                    filled: false,
                    border: UnderlineInputBorder(),
                    labelText: "Full Name"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 360, 0, 0),
            child: SizedBox(
              width: 285,
              height: 50,
              child: TextFormField(
                style: TextStyle(color:Colors.white70),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white70,
                      size: 20,
                    ),
                    floatingLabelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontFamily: "Hellix"),
                    filled: false,
                    border: UnderlineInputBorder(),
                    labelText: "Email Adress"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 425, 0, 0),
            child: SizedBox(
              width: 285,
              height: 50,
              child: TextFormField(
                style: TextStyle(color:Colors.white70),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white70,
                      size: 20,
                    ),
                    suffixIcon: Icon(Icons.visibility_off_outlined, size: 20),
                    floatingLabelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontFamily: "Hellix"),
                    filled: false,
                    border: UnderlineInputBorder(),
                    labelText: "Password"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 530, 0, 0),
            child: SizedBox(
              width: 285,
              height: 45,
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
                          color: Colors.white,
                          fontFamily: "Hellix",
                          fontWeight: FontWeight.w100))),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(70, 690, 0, 0),
            child: Row(
              children: [
                Text(
                  "Already registered?",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
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
                        fontSize: 12,
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
