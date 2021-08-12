import 'package:flutter/material.dart';
import 'package:majorproject/pages/detailspage.dart';
import 'package:majorproject/pages/mainpage.dart';
import 'package:majorproject/pages/mappage.dart';
import 'package:majorproject/pages/onboardingpage.dart';
import 'package:majorproject/pages/selectedcategorypage.dart';
import 'package:majorproject/pages/splashpage.dart';
import 'package:majorproject/pages/welcomepage.dart';
import 'package:majorproject/services/cartservice.dart';
import 'package:majorproject/services/categoryselectionservice.dart';
import 'package:majorproject/services/loginservice.dart';

import 'package:provider/provider.dart';

import 'helpers/utils.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => LoginService()
        ),
        ChangeNotifierProvider(
          create: (_) => CategorySelectionService()
        ),
        ChangeNotifierProvider(
          create: (_) => CartService()
        )
      ],
      child: MaterialApp(
        navigatorKey: Utils.mainAppNav,
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 3, goToPage: WelcomePage()),
          '/welcomepage': (context) => WelcomePage(),
          '/mainpage': (context) => MainPage(),
          '/selectedcategorypage': (context) => SelectedCategoryPage(),
          '/detailspage': (context) => DetailsPage(),
          '/mappage': (context) => MapPage(),
          '/onboardingpage': (context) => OnboardingPage(),
        },
        
      )
    )
  );
}



