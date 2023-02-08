import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/screens/products/coffee_details_page.dart';
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
    for (var item in _coffeeProductList.coffeeProductsList) {
      products.add(item.description!);
    }

    for (var item in products) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
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
          // var result = matchQuery[index];
          // // return ListTile(
          // //   onTap: () {
          // //     // query = result;
          // //     // int index =
          // //   },
          // //   title: Text(result),
          // // );
        }));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }
}
