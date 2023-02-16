import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_wise/app/presentation/blocs/board_data/board_data_bloc.dart';
import 'package:time_wise/app/presentation/blocs/firebase_auth/login/authentication_bloc.dart';
import 'package:time_wise/app/presentation/pages/add_task_form/add_task_form.dart';

import 'package:time_wise/app/presentation/pages/loading_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/codegen_loader.g.dart';
import '../../presentation/blocs/history/history_bloc.dart';
import '../../presentation/pages/auth/login.dart';
import '../../presentation/pages/auth/sign_up.dart';
import '../../presentation/pages/history/history.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/root_widget.dart';
import '../../presentation/pages/timer_widget/timer_widget.dart';
import '../../presentation/providers/auth/logout_provider.dart';
import '../../presentation/providers/loading_provider.dart';
import '../../presentation/providers/theme_type_provider.dart';
import '../../presentation/providers/timer_provider.dart';

import '../entities/board_task.dart';


class ScreenFactory {

  Widget makeRootPage() {
    return EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => ThemeProvider(),
        child: const RootWidget(),
      ),
    );
  }

  Widget makeLoader() {
    return ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context) => LoadingService(),
      child: const LoadingPage(),
    );
  }


  Widget makeLogin() {
    //login page in bloc provider
    return BlocProvider(
      create: (BuildContext context) => AuthenticationBloc(),
      child: const LoginPage(),
    );
  }

  Widget makeSignUp() {
    return BlocProvider(
        create: (BuildContext context) => AuthenticationBloc(),
        child: const SignUpPage(),
      );
  }


  Widget makeHomePage() {
    return MultiProvider(providers: [
      ChangeNotifierProvider<LogoutService>(
          create: (BuildContext context) => LogoutService())
    ], child: BlocProvider(
        create: (BuildContext context) => BoardDataBloc(),
        child: const Home()));
  }

  Widget makeTimerWidget({required BoardTaskEntity boardTaskEntity}) {
    return ChangeNotifierProvider<TimerService>(
        create: (BuildContext context) =>
            TimerService(boardTaskEntity: boardTaskEntity),
        child: const TimerWidget());
  }

  Widget makeHistory() {
    return BlocProvider(
      create: (BuildContext context) => HistoryBloc(),

          child: const HistoryPage()
    );
  }

  //add task form
  Widget makeAddTaskForm() {
    return BlocProvider(
      create: (BuildContext context) => BoardDataBloc(),
          child: const AddTaskForm()
    );
  }
}
