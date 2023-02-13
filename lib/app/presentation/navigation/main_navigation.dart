import 'package:flutter/material.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const login = '/login';
  static const signUp = '/signUp';
  static const homePage = '/home_page';
  static const timerWidget = '/timer_widget';
  static const history = '/history';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.login: (_) => _screenFactory.makeLogin(),
    MainNavigationRouteNames.signUp: (_) => _screenFactory.makeSignUp(),
    MainNavigationRouteNames.homePage: (_) => _screenFactory.makeHomePage(),
    MainNavigationRouteNames.history: (_) => _screenFactory.makeHistory(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.timerWidget:
        final arguments = settings.arguments;
        final boardTaskEntity = arguments is BoardTaskEntity ? arguments : null;
        return MaterialPageRoute(
          builder: (_) =>
              _screenFactory.makeTimerWidget(boardTaskEntity: boardTaskEntity!),
        );
      case MainNavigationRouteNames.history:
        return MaterialPageRoute(
          builder: (_) =>
              _screenFactory.makeHistory(),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
