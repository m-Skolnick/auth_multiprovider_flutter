import 'package:auth_multiprovider_flutter/Page/Login/auth_provider.dart';
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
