import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/screens/products/coffee_details_page.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  late final CoffeeProductList coffeeProduct;
  List<String> allData = [
    'Cafe Amaratto',
    'Cafe Cinnamon',
    'English Caramel',
    'White Russian',
    'Dulce De Leche',
    'Coffee De Luxce'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var result = matchQuery[index];
          return ListTile(
            onTap: () {
              showResults(context);
            },
            title: Text(result),
          );
        }));
  }

  @override
  Widget buildResults(BuildContext context) {
    return CoffeeDetailsPage(coffeeProduct: coffeeProduct);
  }
}
