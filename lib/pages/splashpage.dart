import 'package:flutter/material.dart';
import 'package:majorproject/helpers/appcolors.dart';
import 'package:majorproject/helpers/my_flutter_app_icons.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
        body: Container(
            color: AppColors.MAIN_COLOR,
            alignment: Alignment.center,
            child: Icon(MyFlutterApp.shopping_basket,
                color: Colors.white, size: 100)));
  }
}
