import 'package:auth_multiprovider_flutter/common/auth_service.dart';
import 'package:auth_multiprovider_flutter/common/router.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Sign Out'),
            onTap: () {
              Auth.shared.signOut();

              // We purposely always return false for Predicate. So this call does two things:
              // 1. Push your login page.
              // 2. Remove all your routes so that "back" can't be pressed from the login page,
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginRoute, (_) => false);
            },
          ),
        ],
      ),
    );
  }
}
