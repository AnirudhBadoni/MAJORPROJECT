import 'package:flutter/material.dart';
import 'package:majorproject/helpers/utils.dart';
import 'package:majorproject/models/category.dart';
import 'package:majorproject/pages/settingspage.dart';
import 'package:majorproject/pages/shoppinglistpage.dart';
import 'package:majorproject/widgets/categorybottombar.dart';
import 'package:majorproject/widgets/mainappbar.dart';
import 'package:majorproject/widgets/sidemenubar.dart';

import 'categorylistpage.dart';
import 'favoritespage.dart';


class MainPage extends StatelessWidget {

  List<Category> categories = Utils.getMockedCategory();

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: SideMenuBar()
      ),
      appBar: MainAppBar(),
      body: Container(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Navigator(
                    key: Utils.mainListNav,
                    initialRoute: '/',
                    onGenerateRoute: (RouteSettings settings) {

                      Widget page;

                      switch(settings.name) {
                        case '/':
                          page = CategoryListPage();
                          break;
                        case '/mainpage/favoritespage':
                          page = FavoritesPage();
                          break;
                        case '/mainpage/shoppinglistpage':
                          page = ShoppingListPage();
                          break;
                        case '/mainpage/settingspage':
                          page = SettingsPage();
                          break;
                        default:
                          page = CategoryListPage();
                          break;
                      }

                      return PageRouteBuilder(
                        pageBuilder: (_, __, ___) => page,
                        transitionDuration: const Duration(seconds: 0)
                      );
                    },
                  )
                ),
                CategoryBottomBar()
              ],
            )
      )
    );
  }
}