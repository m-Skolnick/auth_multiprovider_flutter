import 'package:auth_multiprovider_flutter/common/auth_service.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String get myUserIdAccessableInHomeProvider => Auth.shared.myUserId;
}
