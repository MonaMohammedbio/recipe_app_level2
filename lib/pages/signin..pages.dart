

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipe_app_level2/pages/Register.pages.dart';
import 'package:recipe_app_level2/pages/homepage.pages.dart';
import 'package:recipe_app_level2/provider/app_auth.provider.dart';


class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {


  @override
  void initState() {
Provider.of <AppAuthProvider>(context,listen:false).providerInit();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       
        child: Consumer<AppAuthProvider>(builder:(context,authProvider,_)=>
         Form(
            key:authProvider.formKey,
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
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(60, 40, 0, 0),
                  child: Image(
                      color: Colors.black12,
                      colorBlendMode: BlendMode.difference,
                      height: 270,
                      width: 270,
                      image: AssetImage("images/Logo.png")),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(160, 270, 0, 240),
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Hellix"),
                    "Sign in"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 330, 0, 0),
                child: SizedBox(
                  width: 285,
                  height: 50,
                  child: TextFormField(
                      style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                      controller: authProvider.emailController,
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
                          hintStyle: TextStyle(color: Colors.white60),
                          hintText: "Email Adress"),
                      validator: (value) {
                        if (value == null ||( value?.isEmpty??false)) {
                          return 'Email is Required';
                        }
          
                        // if (!EmailValidator.validate(value)) {
                        //   return 'Not Valid Email';
                        // }
                        return null;
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 390, 0, 0),
                child: SizedBox(
                  width: 285,
                  height: 50,
                  child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: authProvider.obsecureText,
                      controller:authProvider.passwordController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.white,
                            size:30,
                          ),
                          suffixIcon: InkWell(
                              onTap: () => authProvider.toggleObsecure(),
                              child: authProvider.obsecureText
                                    ? Icon(Icons.visibility_off_outlined, size: 20,
                                color: Colors.white,)
                                    :Icon( Icons.visibility,
                                size: 20,
                                color: Colors.white,
                              )),
                          floatingLabelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Hellix"),
                          filled: false,
                          border: UnderlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.white60),
                          hintText: "Password"),
                      validator: (value) {
                        if (value == null || (value?.isEmpty??false)) {
                          return 'Password is Required';
                        }
          
                        // if (value.length < 6) {
                        //   return 'password too short';
                        // }
                        return null;
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(200, 450, 0, 0),
                child: TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.cyan[800]),
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 530, 0, 0),
                child: SizedBox(
                  width: 320,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.deepOrange),
                      onPressed: (){authProvider.signin(context);
                      },





                      child: Text("Sign in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Hellix",
                              fontWeight: FontWeight.bold))),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(80, 710, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Don't have an account?",
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
                                  builder: (contxt) => registerPage()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepOrange,
                              fontFamily: "Hellix",
                              fontWeight: FontWeight.w100),
                        )),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
