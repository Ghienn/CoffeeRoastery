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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _coffeeProductController = Get.put(CoffeeProductController());
  final _productController = Get.put(ProductController());
  final _coffeeToolController = Get.put(CoffeeToolController());

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
        body: ListView(
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AllProductsPage()));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  'See all',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16.0,
                      color: Color(0xFFCEC7C4)),
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AllProductPage()));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  'See all',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16.0,
                      color: Color(0xFFCEC7C4)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 540,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    color: Colors.white,
                  ),
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                print(_productController.productsList[index]);
                return ProductCard(
                    product: _productController.productsList[index]);
              }),
        ),
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
                      fontSize: 16.0,
                      color: Color(0xFFCEC7C4)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 540,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    color: Colors.white,
                  ),
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                print(_coffeeToolController.coffeeToolList[index]);
                return CoffeeToolCard(
                    coffeeTool: _coffeeToolController.coffeeToolList[index]);
              }),
        ),
      ],
    ));
  }

  _coffeeListCard(String imgPath, String coffeeName, String shopName,
      String description, bool isFavorite) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => CoffeeDetailsPage()));
      },
      child: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Container(
              height: 300.0,
              width: 225.0,
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    Container(height: 345.0),
                    Positioned(
                        top: 75.0,
                        child: Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            height: 260.0,
                            width: 225.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Color(0xFFB68E72)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    height: 150.0,
                                  ),
                                  Text(
                                    coffeeName,
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 50.0,
                                        width: 150.0,
                                        child: Text(
                                          description,
                                          maxLines: 4,
                                          style: const TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 12.0,
                                              // fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                          height: 20.0,
                                          width: 20.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: Colors.white),
                                          child: Center(
                                              child: Icon(Icons.favorite,
                                                  color: isFavorite
                                                      ? Colors.red
                                                      : Colors.grey,
                                                  size: 12.0)))
                                    ],
                                  )
                                ]))),
                    Positioned(
                        top: 0.0,
                        child: Container(
                            height: 230.0,
                            width: 230.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imgPath),
                                    fit: BoxFit.contain))))
                  ]),
                ],
              ))),
    );
  }
}

//search bar
class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Arabica',
    'Culi',
    'Cherry',
    'Moka',
    'Robusta',
    'Espresso',
    'Cappuccino',
    'Macchiato',
    'Latte'
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

// void fetchData() async {
//   var dio = Dio();
//   var response = await dio
//       .get("http://103.157.218.115/CoffeeRoastery/hs/CoffeeRoastery/V1/User");
//   print(response.statusCode);
//   print(response.data["Metadata"]);
// }
