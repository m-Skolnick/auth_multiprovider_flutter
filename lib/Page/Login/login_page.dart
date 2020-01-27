import 'package:auth_multiprovider_flutter/Page/Login/login_provider.dart';
import 'package:auth_multiprovider_flutter/common/auth_service.dart';
import 'package:auth_multiprovider_flutter/common/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loginProvider = Provider.of<LoginProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: <Widget>[
            Text("You're on the Log in page"),
            Text("Current userID: ${Auth.shared.myUserId}"),
            Padding(
              padding: EdgeInsets.only(top: 22.0),
            ),
            Container(
              width: screenWidth - 44,
              child: Text(
                _loginProvider.authStateDescription,
                textAlign: TextAlign.center,
              ),
            ),
            _loginProvider.authState == AuthState.attemptingRefreshTokenSignIn
                ? CircularProgressIndicator()
                : SignInButton(),
          ],
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loginProvider = Provider.of<LoginProvider>(context);
    return RaisedButton(
      padding: EdgeInsets.all(8.0),
      onPressed: () async {
        bool loginSuccess = await _loginProvider.signIn();
        if (loginSuccess) {
          Navigator.pushReplacementNamed(context, HomePageRoute);
        }
      },
      child: _loginProvider.authState == AuthState.attemptingSignIn
          ? CircularProgressIndicator()
          : Text("Sign in"),
    );
  }
}
