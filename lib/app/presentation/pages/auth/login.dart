import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_wise/app/presentation/blocs/firebase_auth/login/authentication_bloc.dart';
import 'package:time_wise/app/presentation/navigation/main_navigation.dart';
import 'package:time_wise/app/presentation/pages/auth/components/email_text_field.dart';
import 'package:time_wise/app/presentation/pages/auth/components/login_button.dart';
import 'package:time_wise/app/presentation/pages/auth/components/password_text_field.dart';
import 'package:time_wise/app/presentation/pages/auth/components/underlined_text_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //time wise logo
            const Text(
              "Time Wise",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30.0,
            ),
            EmailTextField(
              onChanged: (String email) {
                context
                    .read<AuthenticationBloc>()
                    .add(UpdateEmailEvent(email: email));
              },
            ),
            const SizedBox(height: 10.0),
            PasswordTextField(onChanged: (String password) {
              context
                  .read<AuthenticationBloc>()
                  .add(UpdatePasswordEvent(password: password));
            }),
            const SizedBox(height: 16.0),
            LoginButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(LoginEvent());
              },
              text: "LOGIN",
            ),
            UnderlinedTextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteNames.signUp);
              },
              thinText: "Don't have an account?",
              boldText: "Sign up",
            ),
            const SizedBox(
              height: 10.0,
            ),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
              if (state is ErrorState) {
                return Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                );
              }
              return const SizedBox.shrink();
            }),
          ]),
        ),
      ));
  }
}
