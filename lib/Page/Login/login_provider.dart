import 'dart:async';

import 'package:auth_multiprovider_flutter/common/auth_service.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  AuthState authState = AuthState.signedOut;
  String get authStateDescription => getAuthStateDescription(authState);

  LoginProvider() {
    _startListeningToAuthStateStream();
    _attemptRefreshTokenSignIn();
  }

  _startListeningToAuthStateStream() {
    Auth.shared.authStateStreamController.stream.listen((newAuthState) {
      if (authState != newAuthState) {
        authState = newAuthState;
        notifyListeners();
      }
    });
  }

  Future<bool> signIn() async {
    return await Auth.shared.signIn();
  }

  _attemptRefreshTokenSignIn() {
    Auth.shared.attemptRefreshTokenSignIn();
  }
}
