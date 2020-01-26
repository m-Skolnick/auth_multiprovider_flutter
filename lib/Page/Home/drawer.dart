import 'package:auth_multiprovider_flutter/Page/Login/auth_provider.dart';
import 'package:auth_multiprovider_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);
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
              _authProvider.signOut();
              //Predicate always returns false
              // This will:
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
