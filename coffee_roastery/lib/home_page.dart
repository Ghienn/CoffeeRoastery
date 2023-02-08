import 'package:coffee_roastery/components/accessories_card.dart';
import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/controller/coffee_product_controller.dart';
import 'package:coffee_roastery/controller/coffee_tool_controller.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/coffee_tool.dart';
import 'package:coffee_roastery/screens/accessories/all_accessories.dart';
import 'package:coffee_roastery/screens/customDropdownRow.dart';
import 'package:coffee_roastery/screens/customRowComponent.dart';
import 'package:coffee_roastery/screens/machines/all_machines.dart';
import 'package:coffee_roastery/screens/products/all_products.dart';
import 'package:coffee_roastery/screens/products/other_coffee_card.dart';
import 'package:coffee_roastery/screens/search_screen/search_screen.dart';
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
                      // EasySearchBar(
                      //     title: const Text('Example'),
                      //     onSearch: (value) =>
                      //         setState(() => searchValue = value),
                      //     suggestions: _suggestions);
                      // showSearch(context: context, delegate: CustomSearch());
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchPage()));
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
// class CustomSearch extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: Icon(Icons.arrow_back_ios));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final _coffeeProductList = Get.put(CoffeeProductController());

//     List<String> matchQuery = [];
//     List<String> products = <String>[];
//     for (var item in _coffeeProductList.coffeeProductsList) {
//       products.add(item.description!);
//     }

//     for (var item in products) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: ((context, index) {
//           var result = matchQuery[index];
//           return ListTile(
//             // onTap: () {
//             //   buildResultSuccess(context);
//             // },
//             title: Text(result),
//           );
//         }));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final _coffeeProductList = Get.put(CoffeeProductController());

//     List<String> matchQuery = [];
//     List<String> products = <String>[];
//     for (var item in _coffeeProductList.coffeeProductsList) {
//       products.add(item.description!);
//     }

//     for (var item in products) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: ((context, index) {
//           var result = matchQuery[index];
//           return Container(
//             height: 200,
//             width: MediaQuery.of(context).size.width,
//             child: Row(children: [],)
//           );
//         }));
//   }

//   // final _coffeeProductController = Get.put(CoffeeProductController());
//   // @override
//   // Widget buildResultSuccess(CoffeeProductList coffeeProduct) {
//   //   List<String> returnNote() {
//   //     List<String> notes = <String>[];
//   //     for (var note in coffeeProduct.noteList!) {
//   //       notes.add(note.noteDescription!);
//   //     }
//   //     return notes;
//   //   }

//   //   List<String> notelist = returnNote();
//   //   print(notelist);

//   //   return Scaffold(
//   //     body: SafeArea(
//   //       child: Stack(
//   //         children: [
//   //           Positioned(
//   //             child: Container(
//   //                 height: MediaQuery.of(context).size.height * 0.6,
//   //                 width: double.infinity,
//   //                 decoration: BoxDecoration(
//   //                   image: DecorationImage(
//   //                       image: NetworkImage(
//   //                         coffeeProduct.pictureFirebase!,
//   //                       ),
//   //                       fit: BoxFit.cover),
//   //                 )),
//   //           ),
//   //           DraggableScrollableSheet(
//   //               initialChildSize: 0.42,
//   //               minChildSize: 0.42,
//   //               maxChildSize: 0.8,
//   //               builder: (context, controller) {
//   //                 return Container(
//   //                   // ignore: sort_child_properties_last
//   //                   child: ListView(
//   //                     controller: controller,
//   //                     // ignore: prefer_const_literals_to_create_immutables
//   //                     children: [
//   //                       Padding(
//   //                         padding: EdgeInsets.only(
//   //                           left: 20.0,
//   //                           top: 20.0,
//   //                           right: 30.0,
//   //                         ),
//   //                         child: Text(coffeeProduct.description!,
//   //                             style: TextStyle(
//   //                                 fontFamily: 'SF Pro Display',
//   //                                 color: AppTheme.darkColor,
//   //                                 fontWeight: FontWeight.w700,
//   //                                 fontSize: 35)),
//   //                       ),
//   //                       Padding(
//   //                         padding: const EdgeInsets.only(top: 10),
//   //                         child: CustomDropdownRow(
//   //                           title: 'Source',
//   //                           componentsList: [
//   //                             CustomRowComponent(
//   //                                 title: 'Bean', value: coffeeProduct.bean!),
//   //                             CustomRowComponent(
//   //                                 title: 'Origin',
//   //                                 value: coffeeProduct.origin!),
//   //                             CustomRowComponent(
//   //                                 title: 'Farm', value: coffeeProduct.farm!),
//   //                             CustomRowComponent(
//   //                                 title: 'Altitude',
//   //                                 value:
//   //                                     '${coffeeProduct.altitudeFrom!} - ${coffeeProduct.altitudeTo!}'),
//   //                             CustomRowComponent(
//   //                                 title: 'Varietal',
//   //                                 value: coffeeProduct.varietal!)
//   //                           ],
//   //                           initiallyExpanded: false,
//   //                         ),
//   //                       ),
//   //                       CustomDropdownRow(
//   //                         title: 'Processing Method',
//   //                         componentsList: [
//   //                           CustomRowComponent(
//   //                               title: 'Process', value: 'Honey'),
//   //                           CustomRowComponent(
//   //                               title: 'Grade', value: coffeeProduct.grade!),
//   //                         ],
//   //                         initiallyExpanded: false,
//   //                       ),
//   //                       CustomDropdownRow(
//   //                         title: 'Roast',
//   //                         componentsList: [
//   //                           CustomRowComponent(
//   //                               title: 'Roast Date',
//   //                               value: coffeeProduct.roastDate!),
//   //                           CustomRowComponent(
//   //                               title: 'Roast Purpose',
//   //                               value: coffeeProduct.roastPurpose!),
//   //                         ],
//   //                         initiallyExpanded: false,
//   //                       ),
//   //                       CustomDropdownRow(
//   //                         title: 'Notes',
//   //                         componentsList: [
//   //                           CustomRowComponent(
//   //                               title: 'Note',
//   //                               value: notelist
//   //                                   .toString()
//   //                                   .replaceAll('[', '')
//   //                                   .replaceAll(']', '')),
//   //                         ],
//   //                         initiallyExpanded: false,
//   //                       ),
//   //                       const Padding(
//   //                         padding: EdgeInsets.only(
//   //                           left: 20.0,
//   //                           top: 10.0,
//   //                         ),
//   //                         child: Text("Other Products",
//   //                             style: TextStyle(
//   //                                 fontFamily: 'SF Pro Display',
//   //                                 color: AppTheme.darkColor,
//   //                                 fontWeight: FontWeight.w700,
//   //                                 fontSize: 25)),
//   //                       ),
//   //                       Padding(
//   //                         padding: const EdgeInsets.only(left: 20, top: 20),
//   //                         child: Container(
//   //                           height: 225.0,
//   //                           child: ListView.builder(
//   //                             scrollDirection: Axis.horizontal,
//   //                             itemCount: _coffeeProductController
//   //                                 .coffeeProductsList.length,
//   //                             itemBuilder: (BuildContext context, int index) {
//   //                               return OtherCoffeeCard(
//   //                                   coffeeProductList: _coffeeProductController
//   //                                       .coffeeProductsList[index]);
//   //                             },
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                   decoration: BoxDecoration(
//   //                       color: AppTheme.whiteColor,
//   //                       borderRadius: BorderRadius.circular(25)),
//   //                 );
//   //               }),
//   //           Positioned(
//   //               top: 25,
//   //               left: 15,
//   //               child: GestureDetector(
//   //                 onTap: () {
//   //                   Navigator.of(context).pop();
//   //                 },
//   //                 child: Container(
//   //                   height: 45.0,
//   //                   width: 45.0,
//   //                   decoration: BoxDecoration(
//   //                     borderRadius: BorderRadius.circular(10.0),
//   //                     image: DecorationImage(
//   //                         image: AssetImage('assets/back.png'),
//   //                         fit: BoxFit.cover),
//   //                   ),
//   //                 ),
//   //               ))
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
