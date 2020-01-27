import 'dart:async';

enum AuthState {
  signedOut,
  attemptingRefreshTokenSignIn,
  refreshTokenSignInFailed,
  attemptingSignIn,
  signInFailed,
  signedIn,
}

class Auth {
  String myUserId;
  AuthState authState = AuthState.signedOut;
  var authStateStreamController = StreamController<AuthState>();
  // Singleton for global auth access
  static final Auth _singleton = Auth._internal();
  factory Auth() => _singleton;
  Auth._internal();
  static Auth get shared => _singleton;

  attemptRefreshTokenSignIn() async {
    _updateAuthState(AuthState.attemptingRefreshTokenSignIn);
    //If you store a refresh token you could attempt to sign-in with the refresh token here
    myUserId = await _simulateRefreshTokenSignIn();
    var newAuthState = myUserId != null
        ? AuthState.signedIn
        : AuthState.refreshTokenSignInFailed;
    _updateAuthState(newAuthState);
  }

  Future<bool> signIn() async {
    _updateAuthState(AuthState.attemptingSignIn);

    //Do your auth sign-in here
    myUserId = await _simulateSignIn();

    bool isSuccessfulSignIn = myUserId != null;
    _updateAuthState(
        isSuccessfulSignIn ? AuthState.signedIn : AuthState.signInFailed);
    return isSuccessfulSignIn;
  }

  signOut() {
    //Do your firebase or other auth sign out here...
    myUserId = null;
    _updateAuthState(AuthState.signedOut);
  }

  _updateAuthState(AuthState newAuthState) {
    authState = newAuthState;
    authStateStreamController.sink.add(newAuthState);
  }

  Future<String> _simulateRefreshTokenSignIn() async {
    // Simulate a delay while authentication is awaited.
    // We're pretending the refresh token sign-in fails, so we return null
    await Future.delayed(Duration(seconds: 3));
    return null;
  }

  Future<String> _simulateSignIn() async {
    // Simulate a delay while authentication response is awaited
    await Future.delayed(Duration(seconds: 3));
    return "ExampleUserId321";
  }
}

String getAuthStateDescription(AuthState authState) {
  String status;

  switch (authState) {
    case AuthState.attemptingRefreshTokenSignIn:
      status = "Attempting refresh token sign in...";
      break;
    case AuthState.refreshTokenSignInFailed:
      status = "Refresh token sign-in failed";
      break;
    case AuthState.attemptingSignIn:
      status = "Attempting sign in...";
      break;
    case AuthState.signedIn:
      status = "Successful Sign in";
      break;
    case AuthState.signInFailed:
      status = "Sign in failed";
      break;
    case AuthState.signedOut:
      status = "Signed out";
  }
  return status;
}
