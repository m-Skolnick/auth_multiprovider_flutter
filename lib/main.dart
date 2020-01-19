import 'package:auth_multiprovider_flutter/Page/Home/home_page.dart';
import 'package:auth_multiprovider_flutter/Page/Home/home_provider.dart';
import 'package:auth_multiprovider_flutter/Page/Login/auth_provider.dart';
import 'package:auth_multiprovider_flutter/Page/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    return MaterialApp(
      title: 'Auth Mutli Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _authProvider.myUserId == null ? LoginPage() : HomePage(),
    );
  }
}
