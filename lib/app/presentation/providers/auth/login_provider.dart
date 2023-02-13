import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_wise/app/domain/usecases/auth/signin.dart';

class LoginService extends ChangeNotifier{

  final FirebaseAuthSignIn signIn = FirebaseAuthSignIn();

  String errorMessage = "";
  bool isLoading = false;

  String email = "";
  String password = "";

  bool signedIn = false;

  LoginService();


  void login() async{
    try {
      isLoading = true;
      notifyListeners();
      await signIn(email, password);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
    } finally {
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

}