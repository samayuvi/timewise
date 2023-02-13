import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_wise/app/domain/factories/screen_factory.dart';
import 'package:easy_localization/easy_localization.dart';


final navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ScreenFactory().makeRootPage());
}
