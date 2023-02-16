import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_wise/app/presentation/blocs/firebase_auth/login/authentication_bloc.dart';

import 'components/email_text_field.dart';
import 'components/login_button.dart';
import 'components/password_text_field.dart';
import 'components/underlined_text_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final signUpService = context.watch<SignUpService>();
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Time Wise", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 30.0,),
          EmailTextField(
            onChanged: (String email) {
              context.read<AuthenticationBloc>().add(UpdateEmailEvent(email: email));
            },
          ),
          const SizedBox(height: 10.0),
          PasswordTextField(onChanged: (String password) {
            context.read<AuthenticationBloc>().add(UpdatePasswordEvent(password: password));

          }),
          const SizedBox(height: 16.0),
          LoginButton(
            onPressed: () {
              context.read<AuthenticationBloc>().add(SignUpEvent());
              Navigator.pop(context);
            },
            text: "SIGN UP",
          ),
          UnderlinedTextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(context);
            },
            thinText: "Already have an account?",
            boldText: "Login",
          ),
          const SizedBox(
            height: 10.0,
          ),
          BlocBuilder<AuthenticationBloc,AuthenticationState>(
            builder: (context, state) {
              return Text(
                state is ErrorState ? state.message : "",
                style: const TextStyle(color: Colors.red),
              );
            }
          ),
        ]),
      ),
    ));
  }
}
