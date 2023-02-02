import 'package:coffee_roastery/components/accessories_card.dart';
import 'package:coffee_roastery/controller/coffee_bean_controller.dart';
import 'package:coffee_roastery/models/coffee_products.dart';
import 'package:coffee_roastery/screens/accessories/all_accessories.dart';
import 'package:coffee_roastery/screens/machines/all_machines.dart';
import 'package:coffee_roastery/screens/products/all_products.dart';
import 'package:coffee_roastery/service/api_handler.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'screens/products/coffee_details_page.dart';
import 'components/machine_card.dart';
import 'screens/machines/gear_detail.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        Container(
            height: 350.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return _coffeeListCard(
                    'assets/coffee1.webp',
                    'Caffe Misto',
                    'Coffeeshop',
                    'Our dark, rich espresso balanced with steamed milk and a light layer of foam',
                    // '\$4.99',
                    false);
              },
            )),
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
                    MaterialPageRoute(builder: (context) => AllMachinesPage()));
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
        SizedBox(height: 10.0),
        const MachineCard(),
        SizedBox(height: 10.0),
        const MachineCard(),
        SizedBox(height: 25.0),
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
        SizedBox(height: 10.0),
        const AccessoriesCard(),
        SizedBox(height: 10.0),
        const AccessoriesCard(),
        SizedBox(height: 10.0),
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
                                      // Text(
                                      //   price,
                                      //   style: const TextStyle(
                                      //       fontFamily: 'SF Pro Display',
                                      //       fontSize: 16.0,
                                      //       fontWeight: FontWeight.bold,
                                      //       color: Color(0xFF3A4742)),
                                      // ),
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

CoffeeBeanController coffeeBeanController = Get.put(CoffeeBeanController());

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
            title: Text(result),
          );
        }));
  }
}
