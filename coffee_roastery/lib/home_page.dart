import 'package:coffee_roastery/components/accessories_card.dart';
import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/controller/coffee_product_controller.dart';
import 'package:coffee_roastery/controller/coffee_tool_controller.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/coffee_tool.dart';
import 'package:coffee_roastery/screens/accessories/all_accessories.dart';
import 'package:coffee_roastery/screens/machines/all_machines.dart';
import 'package:coffee_roastery/screens/products/all_products.dart';
import 'package:coffee_roastery/service/api_handler.dart';
import 'package:coffee_roastery/service/networking.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller/machine_controller.dart';
import 'models/product.dart';
import 'screens/products/coffee_details_page.dart';
import 'components/machine_card.dart';
import 'screens/machines/gear_detail.dart';

class MyHomePage extends StatelessWidget {
  final _productController = Get.put(ProductController());
  final _coffeeToolController = Get.put(CoffeeToolController());
  final _coffeeProductController = Get.put(CoffeeProductController());

  @override
  Widget build(BuildContext context) {
    ApiRequest.getCoffeeProduct("0365582274", '1').then((value) {
      print(value);
      List<CoffeeProductList> coffeeProductList =
          value['coffeeProducts'] ?? <CoffeeProductList>[];
      List<ProductList> productList = value['products'] ?? <ProductList>[];
      List<CoffeeToolList> toolList = value['tools'] ?? <CoffeeToolList>[];
      _coffeeProductController.coffeeProductsList.clear();
      _productController.productsList.clear();
      _coffeeToolController.coffeeToolList.clear();
      _coffeeProductController.coffeeProductsList.addAll(coffeeProductList);
      _productController.productsList.addAll(productList);
      _coffeeToolController.coffeeToolList.addAll(toolList);
    });

    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/menu.png'),
                          fit: BoxFit.cover),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: CustomSearch());
                    },
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/search.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(height: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Morning,',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkColor)),
              Text('Begins with Energy',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkColor)),
            ],
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              // ignore: prefer_const_constructors
              Text(
                'COFFEE PRODUCTS',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 20.0,
                    color: AppTheme.darkColor,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AllProductsPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 153, 137, 130)),
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: 15.0),
          SizedBox(
              height: 350.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _coffeeProductController.coffeeProductsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(_coffeeProductController.coffeeProductsList[index]);
                    return CoffeeProductCard(
                        coffeeProduct:
                            _coffeeProductController.coffeeProductsList[index]);
                  })),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Text(
                'MACHINE GEAR',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 20.0,
                    color: AppTheme.darkColor,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AllProductPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 153, 137, 130)),
                  ),
                ),
              ),
            ],
          ),
          ...List.generate(3, (index) {
            return ProductCard(product: _productController.productsList[index]);
          }),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Text(
                'ACCESSORIES',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 20.0,
                    color: AppTheme.darkColor,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AllAccessoriesPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 153, 137, 130)),
                  ),
                ),
              ),
            ],
          ),
          ...List.generate(3, (index) {
            return CoffeeToolCard(
                coffeeTool: _coffeeToolController.coffeeToolList[index]);
          }),
          SizedBox(height: 30)
        ],
      ),
    ));
  }
}

//search bar
class CustomSearch extends SearchDelegate {
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
            title: Text(result),
          );
        }));
  }

  @override
  Widget buildResults(BuildContext context) {
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
            title: GestureDetector(child: Text(result)),
          );
        }));
  }
}
