import 'package:coffee_roastery/components/accessories_card.dart';
import 'package:coffee_roastery/screens/products/coffee_details_page.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../components/machine_card.dart';
import '../../components/products_card.dart';
import '../../controller/coffee_product_controller.dart';
import '../../home_page.dart';
import '../../models/coffee_product.dart';

class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  final _coffeeBeanController = Get.put(CoffeeProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(padding: EdgeInsets.only(left: 20.0), children: <Widget>[
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
                      image: AssetImage('assets/menu.png'), fit: BoxFit.cover),
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
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          'ALL PRODUCTS',
          style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 32.0,
              color: AppTheme.darkColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _coffeeBeanController.coffeeProductsList.length,
            itemBuilder: (BuildContext context, int index) {
              print(_coffeeBeanController.coffeeProductsList[index]);
              return ProductsCard(
                  coffeeProduct:
                      _coffeeBeanController.coffeeProductsList[index]);
            }),
      )
    ]));
  }
}
