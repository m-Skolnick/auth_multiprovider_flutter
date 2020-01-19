import 'dart:async';

import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String myUserId;
  bool isAuthenticating = false;

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
