import 'package:auth_multiprovider_flutter/Page/Login/auth_provider.dart';
import 'package:auth_multiprovider_flutter/router.dart';
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
              padding: EdgeInsets.only(top: 12.0),
            ),
            Text("Current userID: ${_authProvider.myUserId}"),
            Padding(
              padding: EdgeInsets.only(top: 44.0),
            ),
            _authProvider.isAttemptingRefreshTokenSignIn
                ? RefreshTokenSignInHappening()
                : SignInOptionsWidget(),
          ],
        ),
      ),
    );
  }
}

class RefreshTokenSignInHappening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20.0,
      children: <Widget>[
        Text("Currently attempting refresh token login...."),
        CircularProgressIndicator(),
      ],
    );
  }
}

class SignInOptionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12.0,
      children: <Widget>[
        Text(_authProvider.isAuthenticating
            ? "Signing in..."
            : "We're pretending your refresh token login failed"),
        RaisedButton(
          padding: EdgeInsets.all(8.0),
          onPressed: () async {
            String myUserId = await _authProvider.signIn();
            if (myUserId != null)
              Navigator.pushReplacementNamed(context, HomePageRoute);
          },
          child: _authProvider.isAuthenticating
              ? CircularProgressIndicator()
              : Text("Sign in"),
        ),
      ],
    );
  }
}
