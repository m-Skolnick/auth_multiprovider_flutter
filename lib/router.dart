import 'package:auth_multiprovider_flutter/Page/Home/home_page.dart';
import 'package:auth_multiprovider_flutter/Page/Login/login_page.dart';
import 'package:flutter/material.dart';

const String HomePageRoute = "/";
const String LoginRoute = "login";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
