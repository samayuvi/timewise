import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_wise/app/domain/usecases/auth/signin.dart';
import 'package:time_wise/app/domain/usecases/auth/signup.dart';

class SignUpService extends ChangeNotifier{

  final FirebaseAuthSignUp signUp = FirebaseAuthSignUp();
  final FirebaseAuthSignIn signIn = FirebaseAuthSignIn();

  String errorMessage = "";
  bool isLoading = false;

  String email = "";
  String password = "";

  SignUpService();


  void register() async{
    try {
      isLoading = true;
      notifyListeners();
      await signUp(email, password);
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