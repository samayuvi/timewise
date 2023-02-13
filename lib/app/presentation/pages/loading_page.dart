import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_wise/app/domain/factories/screen_factory.dart';
import 'package:time_wise/app/presentation/providers/loading_provider.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.watch<LoadingService>().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ScreenFactory().makeLogin();
            }
            return ScreenFactory().makeHomePage();
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
