import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_wise/app/presentation/navigation/main_navigation.dart';
import 'package:time_wise/app/presentation/pages/auth/components/email_text_field.dart';
import 'package:time_wise/app/presentation/pages/auth/components/login_button.dart';
import 'package:time_wise/app/presentation/pages/auth/components/password_text_field.dart';
import 'package:time_wise/app/presentation/pages/auth/components/underlined_text_button.dart';
import 'package:time_wise/app/presentation/providers/auth/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginService = context.watch<LoginService> ();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //time wise logo
              const Text("Time Wise", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30.0,),

              EmailTextField(onChanged: (String email){loginService.email = email;},),
              const SizedBox(height: 10.0),
              PasswordTextField(onChanged: (String password){loginService.password = password;}),
              const SizedBox(height: 16.0),
              LoginButton(onPressed: (){loginService.login();},text: "LOGIN",),
              UnderlinedTextButton(onPressed: (){
                Navigator.of(context).pushNamed(MainNavigationRouteNames.signUp);
              }, thinText: "Don't have an account?", boldText: "Sign up",),
              const SizedBox(height: 10.0,),
              Text(loginService.errorMessage, style: const TextStyle(color: Colors.red),),

              ]),
        ),
    ));
  }
}
