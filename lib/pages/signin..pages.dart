import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_level2/pages/Register.pages.dart';
import 'package:recipe_app_level2/pages/homepage.pages.dart';
import 'package:recipe_app_level2/services/shared%20prefrences.services.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> fromKey;

  bool obsecureText = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fromKey = GlobalKey<FormState>();

    super.initState();
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    setState(() {});
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
                padding: EdgeInsets.fromLTRB(130, 0, 0, 240),
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Hellix"),
                    "Sign in"),
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
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email is required';
                    }

                    if (!EmailValidator.validate(value)) {
                      return 'Not Valid Email';
                    }
                    return null;
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 360, 0, 0),
            child: SizedBox(
              width: 285,
              height: 50,
              child: TextFormField(
                  style: TextStyle(color:Colors.white70),
                obscureText: obsecureText,
                controller: passwordController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white70,
                      size: 20,
                    ),
                    suffixIcon: InkWell(
                        onTap: () => toggleObsecure(),
                        child: Icon(obsecureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility , size: 20)),
                    floatingLabelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontFamily: "Hellix"),
                    filled: false,
                    border: UnderlineInputBorder(),
                    labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password is required';
                    }

                    if (value.length < 6) {
                      return 'password too short';
                    }
                    return null;
                  }
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 500, 0, 0),
            child: SizedBox(
              width: 285,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.deepOrange),
                  onPressed: () async {
                    if (fromKey.currentState?.validate() ?? false) {
                      await PrefrencesService.prefs?.setBool('isLogin', true);

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                    }
                  },
                  child: Text("Sign in",
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
                  "Don't have an account?",
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
                              builder: (contxt) => registerPage()));
                    },
                    child: Text(
                      "Register",
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
