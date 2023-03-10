import 'package:coffee_roastery/components/accessories_card.dart';
import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/controller/coffee_product_controller.dart';
import 'package:coffee_roastery/controller/coffee_tool_controller.dart';
import 'package:coffee_roastery/custom_search.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/coffee_tool.dart';
import 'package:coffee_roastery/screens/accessories/all_accessories.dart';
import 'package:coffee_roastery/screens/customDropdownRow.dart';
import 'package:coffee_roastery/screens/customRowComponent.dart';
import 'package:coffee_roastery/screens/machines/all_machines.dart';
import 'package:coffee_roastery/screens/navigation_drawer.dart';
import 'package:coffee_roastery/screens/products/all_products.dart';
import 'package:coffee_roastery/screens/products/other_coffee_card.dart';
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
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _productController = Get.put(ProductController());

  final _coffeeToolController = Get.put(CoffeeToolController());

  final _coffeeProductController = Get.put(CoffeeProductController());

  final GlobalKey<_MyHomePageState> _refreshIndicatorKey =
      GlobalKey<_MyHomePageState>();

  Future<void> ProductsListRefresh() async {
    var value = await ApiRequest.getCoffeeProduct("0365582274", '1');
    List<CoffeeProductList> coffeeProductList =
        value['coffeeProducts'] ?? <CoffeeProductList>[];
    List<ProductList> productList = value['products'] ?? <ProductList>[];
    List<CoffeeToolList> toolList = value['tools'] ?? <CoffeeToolList>[];

    setState(() {
      _coffeeProductController.coffeeProductsList.clear();
      _productController.productsList.clear();
      _coffeeToolController.coffeeToolList.clear();
      _coffeeProductController.coffeeProductsList.addAll(coffeeProductList);
      _productController.productsList.addAll(productList);
      _coffeeToolController.coffeeToolList.addAll(toolList);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ProductsListRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SafeArea(child: NavigationDrawerWidget()),
        body: RefreshIndicator(
          color: AppTheme.darkColor,
          key: _refreshIndicatorKey,
          onRefresh: () async {
            await ProductsListRefresh();
          },
          child: Builder(builder: (context) {
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.only(left: 15.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 0.0),
                            child: GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/menu.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            )),
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
                            ))
                      ],
                    ),
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
                          Get.to(AllProductsPage());
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
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.69,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount:
                        _coffeeProductController.coffeeProductsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(_coffeeProductController.coffeeProductsList[index]);
                      return AnimationConfiguration.staggeredGrid(
                        columnCount: 2,
                        position: index,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: CoffeeProductCard(
                              coffeeProduct: _coffeeProductController
                                  .coffeeProductsList[index],
                              isFavorite: false,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15.0),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             // ignore: prefer_const_literals_to_create_immutables
                  //             children: <Widget>[
                  //               const Text(
                  //                 'MACHINE GEAR',
                  //                 style: TextStyle(
                  //                     fontFamily: 'SF Pro Display',
                  //                     fontSize: 20.0,
                  //                     color: AppTheme.darkColor,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               InkWell(
                  //                 onTap: () {
                  //                   Navigator.of(context).push(MaterialPageRoute(
                  //                       builder: (context) => AllProductPage()));
                  //                 },
                  //                 child: const Padding(
                  //                   padding: EdgeInsets.only(right: 20.0),
                  //                   child: Text(
                  //                     'See all',
                  //                     style: TextStyle(
                  //                         fontFamily: 'SF Pro Display',
                  //                         fontSize: 18.0,
                  //                         color: Color.fromARGB(255, 153, 137, 130)),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           ...List.generate(3, (index) {
                  //             return ProductCard(
                  //                 product: _productController.productsList[index]);
                  //           }),
                  //           SizedBox(height: 20.0),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             // ignore: prefer_const_literals_to_create_immutables
                  //             children: <Widget>[
                  //               const Text(
                  //                 'ACCESSORIES',
                  //                 style: TextStyle(
                  //                     fontFamily: 'SF Pro Display',
                  //                     fontSize: 20.0,
                  //                     color: AppTheme.darkColor,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               InkWell(
                  //                 onTap: () {
                  //                   Navigator.of(context).push(MaterialPageRoute(
                  //                       builder: (context) => AllAccessoriesPage()));
                  //                 },
                  //                 child: const Padding(
                  //                   padding: EdgeInsets.only(right: 20.0),
                  //                   child: Text(
                  //                     'See all',
                  //                     style: TextStyle(
                  //                         fontFamily: 'SF Pro Display',
                  //                         fontSize: 18.0,
                  //                         color: Color.fromARGB(255, 153, 137, 130)),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           ...List.generate(3, (index) {
                  //             return CoffeeToolCard(
                  //                 coffeeTool:
                  //                     _coffeeToolController.coffeeToolList[index]);
                  //           }),
                  //           SizedBox(height: 30)
                  //         ],
                  //       ),
                  //     );
                  //   }),
                  // ));
                ],
              ),
            );
          }),
        ));
  }
}
