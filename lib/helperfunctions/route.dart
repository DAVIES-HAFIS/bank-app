import 'package:flutter/material.dart';

import '../onboarding_screens.dart';
import '../sign_in.dart';
import '../sign_up.dart';

class AppRouter {
  //create static instance of View models if there would be shared
  // static NotesViewModel notesViewModel = NotesViewModel();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesUrl.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen1());
      case RoutesUrl.loginscreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesUrl.registeration:
        return MaterialPageRoute(builder: (_) => Registeration());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}

//Routes
class RoutesUrl {
  RoutesUrl._();
  static const String splashScreen = "/";
  static const String walkthrough = "/walkthrough";
  static const String firstscreen = "/firstscreen";
  static const String loginscreen = "/loginscreen";
  static const String resetpassword = "/resetpassword";
  static const String verifypassword = "/verifypassword";
  static const String createpassword = "/createpassword";
  static const String registeration = "/registeration";
  static const String verifyaccount = "/verifyaccount";
}
