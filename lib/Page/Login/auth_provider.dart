import 'dart:async';

import 'package:auth_multiprovider_flutter/router.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String myUserId;
  bool isAuthenticating = false;
  bool isAttemptingRefreshTokenSignIn = true;

  AuthProvider() {
    //If you store a refresh token you could attempt to sign-in with the refresh token here
    simulateRefreshTokenSignIn();
  }

  simulateRefreshTokenSignIn() async {
    await Future.delayed(Duration(seconds: 3));
    isAttemptingRefreshTokenSignIn = false;
    notifyListeners();
  }

  Future<String> signIn() async {
    isAuthenticating = true;
    notifyListeners();
    // Do your firebase or other auth sign in here
    await simulateAuthentication().then((myUserId) {
      this.myUserId = myUserId;
      isAuthenticating = false;
    });
    notifyListeners();
    return this.myUserId;
  }

  Future<String> simulateAuthentication() async {
    await Future.delayed(Duration(seconds: 3));
    return "SampleUserId";
  }

  signOut() {
    //Do your firebase or other auth sign out here...
    myUserId = null;
  }
}
