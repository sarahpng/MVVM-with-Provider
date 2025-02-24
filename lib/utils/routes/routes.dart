import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/view/home_view.dart';
import 'package:mvvm_with_provider/view/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [TextFormField()],
                ),
              ),
            );
          },
        );
    }
  }
}
