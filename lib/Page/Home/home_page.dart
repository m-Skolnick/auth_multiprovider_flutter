import 'package:auth_multiprovider_flutter/Page/Home/drawer.dart';
import 'package:auth_multiprovider_flutter/Page/Home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 44.0,
          children: <Widget>[
            Text("You're on the home page"),
            Text(
                "Your current UserID is: \"${_homeProvider.myUserIdAccessableInHomeProvider}\""),
            Text("Now try logging out from the drawer"),
          ],
        ),
      ),
    );
  }
}
