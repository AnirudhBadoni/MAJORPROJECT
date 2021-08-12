import 'package:flutter/material.dart';
import 'package:majorproject/helpers/appcolors.dart';
import 'package:majorproject/helpers/iconhelper.dart';
import 'package:majorproject/helpers/utils.dart';
import 'package:majorproject/models/loginusermodel.dart';
import 'package:majorproject/services/loginservice.dart';

import 'package:provider/provider.dart';

import 'iconfont.dart';

class SideMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    bool userLoggedIn = loginService.loggedInUserModel != null;
    LoginUserModel userModel = loginService.loggedInUserModel;
    String userImg = userModel != null ? userModel.photoUrl : '';
    String userName = userModel != null ? userModel.displayName : '';
    String email = userModel != null ? userModel.email: '';


    return Scaffold(
        body: Container(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(decoration: BoxDecoration(color: AppColors.DARK_GREEN,),
            accountName: Text(userName),
            accountEmail: Text(email),
          ),
          ListTile(
            leading: Icon(
              Icons.group_rounded,
              color: Colors.black,
            ),
            title: Text('Refer a Friend'),
            onTap: () {
              Navigator.pushNamed(context, '/refer');
            },
          ),

          Divider(
            color: Colors.black12,
            height: 10.0,
          ),
          ListTile(
            leading: Icon(
              Icons.call,
              color: Colors.black,
            ),
            title: Text('Help And Support'),
            onTap: () {
              Navigator.pushNamed(context, '/phone');
            },
          ),
          Divider(
            color: Colors.black12,
            height: 10.0,
          ),
          ListTile(
            leading: Icon(
              Icons.system_security_update,
              color: Colors.black,
            ),
            title: Text('Updates'),
            onTap: () {
              Navigator.pushNamed(context, '/updates');
            },
          ),
          Divider(
            color: Colors.black12,
            height: 10.0,
          ),
          ListTile(
            leading: Icon(
              Icons.book_rounded,
              color: Colors.black,
            ),
            title: Text('Tutorial'),
            onTap: () {
              Navigator.pushNamed(context, '/tutorial');
            },
          ),
          Divider(
            color: Colors.black12,
            height: 10.0,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onTap: () async {
                  if (userLoggedIn) {
                    // await loginService.signOut();
                    Utils.mainAppNav.currentState!.pushReplacementNamed('/welcomepage');
                  }
                  else {
                    bool success = await loginService.signInWithGoogle();
                    if (success) {
                      Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                    }
                  }
                },
            title: Text('Sign Out' ),
          ),
        ],
      ),
    )

        );
  }
}
