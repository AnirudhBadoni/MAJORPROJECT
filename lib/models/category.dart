import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Category {
  String name;
  IconData icon;
  Color color;
  String imgName;
  List<Category> subCategories;

  Category(
    {
      required this.name,
      required this.icon,
      required this.color,
      required this.imgName,
      required this.subCategories
    }
  );
}