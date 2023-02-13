import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoadingService extends ChangeNotifier {

  final FirebaseAuth _authService = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _authService.authStateChanges();


}