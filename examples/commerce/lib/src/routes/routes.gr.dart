// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../ui/screens/check_status_screen.dart' as _i3;
import '../ui/screens/login_screen.dart' as _i4;
import '../ui/screens/splash_screen.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreenRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.SplashScreen());
    },
    CheckStatusScreenRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i3.CheckStatusScreen());
    },
    LoginScreenRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.LoginScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i1.RouteConfig(CheckStatusScreenRoute.name,
            path: '/check-status-screen'),
        _i1.RouteConfig(LoginScreenRoute.name, path: '/login-screen')
      ];
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

class CheckStatusScreenRoute extends _i1.PageRouteInfo {
  const CheckStatusScreenRoute() : super(name, path: '/check-status-screen');

  static const String name = 'CheckStatusScreenRoute';
}

class LoginScreenRoute extends _i1.PageRouteInfo {
  const LoginScreenRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}
