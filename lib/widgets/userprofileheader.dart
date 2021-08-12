import 'package:flutter/material.dart';
import 'package:majorproject/models/loginusermodel.dart';
import 'package:majorproject/services/loginservice.dart';

import 'package:provider/provider.dart';

class UserProfileHeader extends StatelessWidget {

  bool showProfilePic;

  UserProfileHeader({
    required this.showProfilePic
  });

  @override
  Widget build(BuildContext context) {

    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    LoginUserModel userModel = loginService.loggedInUserModel;

    String imgPath = userModel != null ? userModel.photoUrl : '';
    
    return this.showProfilePic && imgPath.length > 0 ? 
      Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        child: ClipOval(
          child: Image.network(imgPath)
        )
      ): SizedBox(width: 40, height: 40);
  }
}