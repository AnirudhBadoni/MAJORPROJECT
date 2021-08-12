import 'package:flutter/material.dart';
import 'package:majorproject/helpers/utils.dart';
import 'package:majorproject/models/category.dart';
import 'package:majorproject/services/categoryselectionservice.dart';
import 'package:majorproject/widgets/categorycard.dart';

import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {

  List<Category> categories = Utils.getMockedCategory();

  @override 
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text('Select Your Category:',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black)
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext ctx, int index) {
              return CategoryCard(
                category: categories[index],
                onCardClick: () {
                  catSelection.selectedCategory = this.categories[index];
                  Utils.mainAppNav.currentState!.pushNamed('/selectedcategorypage');
                }
              );
            },
          ),
        )
      ]
    );
  }
}