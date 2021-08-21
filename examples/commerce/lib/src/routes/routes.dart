import 'package:auto_route/auto_route.dart';
import 'package:commerce/src/ui/screens/check_status_screen.dart';
import 'package:commerce/src/ui/screens/login_screen.dart';
import 'package:commerce/src/ui/screens/splash_screen.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute<SplashScreen>(page: SplashScreen, initial: true),
    MaterialRoute<CheckStatusScreen>(page: CheckStatusScreen),
    MaterialRoute<LoginScreen>(page: LoginScreen)
  ],
  routesClassName: "Routes",
)
class $AppRouter {}
