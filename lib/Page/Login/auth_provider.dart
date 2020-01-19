import 'dart:async';

import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String myUserId;
  bool isAuthenticating = false;

  AuthProvider() {
    //If you store a refresh token you could attempt to sign-in with the refresh token here
  }

  signIn() async {
    // Do your firebase or other auth sign in here
    await simulateAuthentication().then((myUserId) {
      this.myUserId = myUserId;
      isAuthenticating = false;
    });
    notifyListeners();
  }

  Future<String> simulateAuthentication() async {
    isAuthenticating = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    return "SampleUserId";
  }

  signOut() {
    //Do your firebase or other auth sign out here...
    myUserId = null;
    notifyListeners();
  }
}
