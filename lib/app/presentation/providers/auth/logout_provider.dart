import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/auth/signout.dart';

class LogoutService extends ChangeNotifier{

  final FirebaseSignOut signout = FirebaseSignOut();

  String errorMessage = "";
  bool isLoading = false;

  String email = "";
  String password = "";

  LogoutService();


  void login() async{
    try {
      isLoading = true;
      notifyListeners();
      await signout();
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
    } finally {
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

}