import 'package:auth_multiprovider_flutter/Page/Home/home_page.dart';
import 'package:auth_multiprovider_flutter/Page/Home/home_provider.dart';
import 'package:auth_multiprovider_flutter/Page/Login/auth_provider.dart';
import 'package:auth_multiprovider_flutter/Page/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "router.dart" as router;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routing',
      onGenerateRoute: router.generateRoute,
      initialRoute: router.LoginRoute,
    );
  }
}
