import 'package:flutter/material.dart';
import 'package:majorproject/helpers/appcolors.dart';
import 'package:majorproject/helpers/iconhelper.dart';
import 'package:majorproject/helpers/my_flutter_app_icons.dart';
import 'package:majorproject/helpers/utils.dart';
import 'package:majorproject/widgets/userprofileheader.dart';


import 'iconfont.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {

  Color themeColor;
  bool showProfilePic;

  MainAppBar({ 
    this.themeColor = AppColors.MAIN_COLOR,
    this.showProfilePic = true  
  });

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {

  @override 
  Widget build(BuildContext context) {
    return AppBar(
        title: GestureDetector(
          onTap: () {
            Utils.mainAppNav.currentState!.popUntil((route) => route.settings.name == '/mainpage');
          },
          child: Center(
            child: Icon(
            MyFlutterApp.shopping_basket,size: 40,color:AppColors.MAIN_COLOR ,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: widget.themeColor),
        actions: [
          UserProfileHeader(
            showProfilePic: widget.showProfilePic,
          )
        ],
      );
  }
}