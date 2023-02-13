import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/main_navigation.dart';
import '../../providers/auth/signup_provider.dart';
import 'components/email_text_field.dart';
import 'components/login_button.dart';
import 'components/password_text_field.dart';
import 'components/underlined_text_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpService = context.watch<SignUpService>();
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Time Wise", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 30.0,),
          EmailTextField(
            onChanged: (String email) {
              signUpService.email = email;
            },
          ),
          const SizedBox(height: 10.0),
          PasswordTextField(onChanged: (String password) {
            signUpService.password = password;
          }),
          const SizedBox(height: 16.0),
          LoginButton(
            onPressed: () {
              signUpService.register();
            },
            text: "SIGN UP",
          ),
          UnderlinedTextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(MainNavigationRouteNames.login);
            },
            thinText: "Already have an account?",
            boldText: "Login",
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            signUpService.errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        ]),
      ),
    ));
  }
}
