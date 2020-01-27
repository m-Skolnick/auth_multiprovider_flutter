import 'package:auth_multiprovider_flutter/Page/Home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Page/Login/login_provider.dart';
import 'common/router.dart' as router;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(),
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
