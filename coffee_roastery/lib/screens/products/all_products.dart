import 'package:coffee_roastery/screens/navigation_drawer.dart';
import 'package:coffee_roastery/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/products_card.dart';
import '../../controller/coffee_product_controller.dart';
import 'package:coffee_roastery/custom_search.dart';

import '../../models/coffee_product.dart';
import '../../service/api_handler.dart';

class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  final _coffeeProductController = Get.put(CoffeeProductController());
  final GlobalKey<_AllProductsPageState> _refreshIndicatorKey =
      GlobalKey<_AllProductsPageState>();

  Future<void> CoffeeListRefresh() async {
    ApiRequest.getCoffeeProduct("0365582274", '1').then((value) {
      List<CoffeeProductList> coffeeProductList =
          value['coffeeProducts'] ?? <CoffeeProductList>[];
      setState(() {
        _coffeeProductController.coffeeProductsList.clear();
        _coffeeProductController.coffeeProductsList.addAll(coffeeProductList);
      });
      print("Update product list");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    CoffeeListRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SafeArea(child: NavigationDrawerWidget()),
        body: RefreshIndicator(
          color: AppTheme.darkColor,
          key: _refreshIndicatorKey,
          onRefresh: () async {
            await CoffeeListRefresh();
          },
          child: Builder(builder: (context) {
            return SafeArea(
              child: ListView(
                  padding: EdgeInsets.only(left: 20.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Padding(
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
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                showSearch(
                                    context: context, delegate: SearchPage());
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
                    ...List.generate(
                        _coffeeProductController.coffeeProductsList.length,
                        (index) {
                      return ProductsCard(
                          coffeeProduct: _coffeeProductController
                              .coffeeProductsList[index]);
                    }),
                    SizedBox(
                      height: 30,
                    )
                  ]),
            );
          }),
        ));
  }
}
