import 'package:flutter/material.dart';
import 'package:majorproject/helpers/appcolors.dart';
import 'package:majorproject/helpers/iconhelper.dart';
import 'package:majorproject/helpers/utils.dart';
import 'package:majorproject/models/cartitem.dart';
import 'package:majorproject/models/subcategory.dart';
import 'package:majorproject/services/cartservice.dart';
import 'package:majorproject/widgets/iconfont.dart';

import 'package:provider/provider.dart';

import 'checkout.dart';

class ShoppingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CartService cartService = Provider.of<CartService>(context, listen: false);

    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: AppColors.MAIN_COLOR,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Your Cart',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize:  25,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        cartService.removeAll();
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: AppColors.DARK_GREEN),
                            SizedBox(width: 5),
                            Text('Delete All',
                              style: TextStyle(color: AppColors.DARK_GREEN, fontSize: 12)
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.MAIN_COLOR.withOpacity(0.2)
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Consumer<CartService>(
                builder: (context, cart, child) {

                  List<Widget> cartItems = [];
                  double mainTotal = 0;

                  if (cart.items.length > 0) {

                    mainTotal = cart.getShoppingCartTotalPrice();
                    
                    cart.items.forEach((CartItem item) {
                      SubCategory itemSubCategory = (item.category as SubCategory);
                      double total = itemSubCategory.getTotalPrice();
                      
                      cartItems.add(
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset.zero
                              )
                            ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset('./assets/imgs/' + itemSubCategory.imgName ,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(itemSubCategory.name, 
                                      style: TextStyle(
                                        color: itemSubCategory.color
                                      )
                                    ),
                                    Text('${itemSubCategory.amount.toString()} ${Utils.weightUnitToString(itemSubCategory.unit)} (\$${itemSubCategory.price.toStringAsFixed(2)} per ${Utils.weightUnitToString(itemSubCategory.unit)})', 
                                      style: TextStyle(
                                        color: Colors.grey
                                      )
                                    ),
                                    Text('\$${total.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: itemSubCategory.color,
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cart.remove(item);
                                },
                                icon: Icon(
                                  Icons.highlight_off,
                                  size: 30,
                                  color: AppColors.MAIN_COLOR 
                                )
                              )
                            ],
                          )
                        )
                      );
                    });

                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                child: Column(children: cartItems),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconFont(iconName: IconFontHelper.LOGO,
                                  color: AppColors.MAIN_COLOR,
                                  size: 40
                                ),
                                SizedBox(width: 10),
                                GestureDetector(onTap: (){ Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Checkout()));},
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: 'Total: \$${mainTotal.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            color: AppColors.MAIN_COLOR,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25
                                          )
                                        ),TextSpan(text: '\nclick to checkout',
                                            style: TextStyle(
                                                color: AppColors.DARK_GREEN,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15
                                            )
                                        )
                                      ]
                                    )
                                  ),
                                )
                              ],
                            )
                          )
                        ],
                      );
                  }
                  else {
                    return Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconFont(
                              iconName: IconFontHelper.LOGO, 

                              size: 30, color: Colors.white,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              width: 2,
                              height: 50,
                              color: Colors.grey[400],
                            ),
                            Text(
                              'Your cart has no items.\nAdd some',
                              style: TextStyle(color: Colors.grey[400])  
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
              )
            )
          ]
        )
    );
  }
}