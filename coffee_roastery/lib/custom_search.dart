import 'package:coffee_roastery/models/coffee_product.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/coffee_product_controller.dart';

class SearchPage extends SearchDelegate<CoffeeProductList> {
  final _searchController = Get.put(CoffeeProductController());
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
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final _coffeeProductList = Get.put(CoffeeProductController());

    List<String> matchQuery = [];
    List<String> products = <String>[];
    for (var itemCoffee in _coffeeProductList.coffeeProductsList) {
      products.add(itemCoffee.description!);
      products.add(itemCoffee.code!);
    }

    for (var itemSearch in products) {
      if (itemSearch.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(itemSearch);
      }
    }

    List<String> suggestions = matchQuery.where((search) {
      final result = search.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: ((context, index) {
          final suggestion = suggestions[index];
          return _coffeeProductList.itemProduct(
              suggestion: suggestion, query: query);
        }));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }
}
