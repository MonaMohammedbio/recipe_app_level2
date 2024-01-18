import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_level2/pages/Register.pages.dart';
import 'package:recipe_app_level2/pages/homepage.pages.dart';
import 'package:recipe_app_level2/pages/signin..pages.dart';

class AppAuthProvider extends ChangeNotifier {
  GlobalKey<FormState>? formkey;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  bool obsecureText = true;

  void providerInit() {
    formkey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  void providerDispose() {
    formkey = null;
    emailController = null;
    passwordController = null;
    nameController = null;
    // obsecureText = false;
  }
  void toggleObsecure(){
    obsecureText!=obsecureText;
    notifyListeners();
  }

  void openRegisterPage(BuildContext context) {
    providerDispose();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => registerPage()));
  }

  void openSiginPage(BuildContext context) {
    providerDispose();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => SigninPage()));
  }

  Future<void> signUp(BuildContext context) async {
    try {
      if (formkey?.currentState?.validate() ?? false) {
        var credentials=await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController!.text, password: passwordController!.text);
        if ( credentials.user!=null){
        await credentials.user?.updateDisplayName(nameController!.text);
        providerDispose();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomePage()));

        }

      }
    } catch (e) {}
  }
}
