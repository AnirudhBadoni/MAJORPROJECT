import 'package:flutter/material.dart';
import 'package:majorproject/helpers/appcolors.dart';
import 'package:majorproject/helpers/my_flutter_app_icons.dart';
import 'package:majorproject/helpers/unitenums.dart';
import 'package:majorproject/models/category.dart';
import 'package:majorproject/models/onboardingcontent.dart';
import 'package:majorproject/models/subcategory.dart';

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
          message: 'Productos\nfrescos, de la\ntierra a su mesa',
          img: 'onboard1'
      ),
      OnboardingContent(
          message: 'Carnes y embutidos\nfrescos y saludables\npara su deleite',
          img: 'onboard2'
      ),
      OnboardingContent(
          message: 'Adquiéralos desde\nla comodidad de su\ndispositivo móbil',
          img: 'onboard3'
      )
    ];
  }

  static String weightUnitToString(WeightUnits unit) {
    switch (unit) {
      case WeightUnits.Kg:
        return 'kg.';

      default:
        return 'kg.';
    }
  }

  static String deviceSuffix(BuildContext context) {
    String deviceSuffix = '';
    TargetPlatform platform = Theme
        .of(context)
        .platform;
    switch (platform) {
      case TargetPlatform.android:
        deviceSuffix = '_android';
        break;
      case TargetPlatform.iOS:
        deviceSuffix = '_ios';
        break;
      default:
        deviceSuffix = '';
        break;
    }

    return deviceSuffix;
  }

  static List<Category> getMockedCategory() {
    return [
      Category(
          color: AppColors.MEATS,
          name: 'Meats',
          icon: MyFlutterApp.meat,
          imgName: 'cat1.png',
          subCategories: [
            SubCategory(
                color: AppColors.MEATS,
                imgName: 'cat1_2.png',
                icon: MyFlutterApp.meat,
                name: 'chicken'),
            SubCategory(
                color: AppColors.MEATS,
                imgName: 'cat1_5.png',
                icon: MyFlutterApp.meat,
                name: 'mutton'),
            SubCategory(
                color: AppColors.MEATS,
                imgName: 'fish.jfif',
                icon: MyFlutterApp.meat,
                name: 'fish'),
          ]),
      Category(
        color: AppColors.VEGS,
        name: 'Vegetables',
        icon: MyFlutterApp.eggplant,
        imgName: 'cat3.png',
        subCategories: [ SubCategory(
            color: AppColors.VEGS,
            imgName: 'cat3_1.png',
            icon: MyFlutterApp.eggplant,
            name: 'Capsicum'),
          SubCategory(
              color: AppColors.VEGS,
              imgName: 'cat3_2.png',
              icon: MyFlutterApp.eggplant,
              name: 'Carrot'),
          SubCategory(
              color: AppColors.VEGS,
              imgName: 'cat3_4.png',
              icon: MyFlutterApp.eggplant,
              name: 'Onion'),
        ],),
      Category(
          color: AppColors.FRUITS,
          name: 'Fruits',
          icon: MyFlutterApp.apple_alt,
          imgName: 'cat2.png',
          subCategories: [
            SubCategory(
                color: AppColors.FRUITS,
                imgName: 'cat2_1.png',
                icon: MyFlutterApp.apple_alt,
                name: 'Kiwi'),
            SubCategory(
                color: AppColors.FRUITS,
                imgName: 'cat2_2.png',
                icon: MyFlutterApp.apple_alt,
                name: 'Banana'),
            SubCategory(
                color: AppColors.FRUITS,
                imgName: 'cat2_4.png',
                icon: MyFlutterApp.apple_alt,
                name: 'Orange'),
          ]),
      Category(
          color: AppColors.SEEDS,
          name: 'Seeds',
          icon: MyFlutterApp.egg,
          imgName: 'cat4.png',
          subCategories: [
            SubCategory(
                color: AppColors.SEEDS,
                imgName: 'cat4_1.png',
                icon: MyFlutterApp.egg,
                name: 'cashew nut'),
            SubCategory(
                color: AppColors.SEEDS,
                imgName: 'cat4_2.png',
                icon: MyFlutterApp.egg,
                name: 'pea nut'),
            SubCategory(
                color: AppColors.SEEDS,
                imgName: 'cat4_3.png',
                icon: MyFlutterApp.egg,
                name: 'almonds'),
            SubCategory(
                color: AppColors.SEEDS,
                imgName: 'cat4_4.png',
                icon: MyFlutterApp.egg,
                name: 'pistachio'),
          ]),
      Category(
          color: AppColors.SPICES,
          name: 'Spices',
          icon: MyFlutterApp.shop,
          imgName: 'cat6.png',
          subCategories: [
            SubCategory(
                color: AppColors.SPICES,
                imgName: 'cat6_1.png',
                icon: MyFlutterApp.shop,
                name: 'coriander powder'),
            SubCategory(
                color: AppColors.SPICES,
                imgName: 'cat6_2.png',
                icon: MyFlutterApp.shop,
                name: 'Red chilli powder'),
            SubCategory(
                color: AppColors.SPICES,
                imgName: 'cat6_3.png',
                icon: MyFlutterApp.shop,
                name: 'black pepper'),
            SubCategory(
                color: AppColors.SPICES,
                imgName: 'cat6_4.png',
                icon: MyFlutterApp.shop,
                name: 'Cinnamon'),
          ]),
      Category(
        color: AppColors.PASTRIES,
        name: 'Sweets',
        icon: MyFlutterApp.shop,
        imgName: 'cat5.png',
        subCategories: [
          SubCategory(
              color: AppColors.PASTRIES,
              imgName: 'ladu.jpg',
              icon: MyFlutterApp.shop,
              name: 'ladu'),

          SubCategory(
              color: AppColors.PASTRIES,
              imgName: 'Gulabjamun.jpg',
              icon: MyFlutterApp.meat,
              name: 'Gulabjamun'),
        ],
      )
    ];
  }
}



