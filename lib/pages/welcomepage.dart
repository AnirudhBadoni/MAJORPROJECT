import 'package:flutter/material.dart';
import 'package:majorproject/helpers/appcolors.dart';
import 'package:majorproject/helpers/my_flutter_app_icons.dart';
import 'package:majorproject/helpers/utils.dart';
import 'package:majorproject/services/loginservice.dart';
import 'package:majorproject/widgets/themebutton.dart';

import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);

    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/imgs/of_main_bg.png',
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Container(
                            width: 180,
                            height: 180,
                            color: AppColors.MAIN_COLOR,
                            alignment: Alignment.center,
                            child: Icon(MyFlutterApp.shopping_basket,
                                color: Colors.white, size: 130),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text('Welcome',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 40),
                      Text('Fresh Products\nAt Your Door Steps',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 40),
                      ThemeButton(
                        label: "Login",
                        labelColor: Colors.white,
                        color: AppColors.MAIN_COLOR,
                        highlight: AppColors.MAIN_COLOR.withOpacity(0.5),
                        borderColor: AppColors.MAIN_COLOR,
                        borderWidth: 4,
                        onClick: () async {
                          bool success = await loginService.signInWithGoogle();

                          if (success) {
                            Utils.mainAppNav.currentState!
                                .pushNamed('/mainpage');
                          }
                        },
                      ), SizedBox(height: 20),
                      Text('Login From Google Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 18)),
                    ],
                  ),
                )
              ],
            )));
  }
}
