

import 'category.dart';

class CartItem {
  Category category;
  int units;

  CartItem({
    required this.category,
    this.units = 0
  });
}