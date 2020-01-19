import 'package:auth_multiprovider_flutter/Page/Login/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You're on the Log in page"),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              padding: EdgeInsets.all(8.0),
              onPressed: () => _authProvider.signIn(),
              child: _authProvider.isAuthenticating
                  ? CircularProgressIndicator()
                  : Text("Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}
