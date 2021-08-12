import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:majorproject/helpers/unitenums.dart';

import 'category.dart';
import 'categorypart.dart';

class SubCategory extends Category {

  List<CategoryPart> parts;
  double price;
  WeightUnits unit;
  int amount;

  double getTotalPrice() {
    return this.amount * this.price;
  }

  SubCategory({
    this.parts = const [],
    this.price = 200.0,
    this.unit = WeightUnits.Kg,
    this.amount = 0,
    required String name,
    required IconData icon,
    required Color color,
    required String imgName
  }): super(
    name: name,
    icon: icon,
    color: color,
    imgName: imgName,subCategories: []
  );
}