import 'package:coffee_roastery/models/product.dart';
import 'package:coffee_roastery/screens/machines/other_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import '../../controller/machine_controller.dart';
import '../../theme.dart';
import '../customDropdownRow.dart';
import '../customRowComponent.dart';

class GearDetailsPage extends StatelessWidget {
  final ProductList product;
  final _productController = Get.put(ProductController());
  GearDetailsPage({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                // height: 550.0,
                // width: double.infinity,
                child: Image.network(product.pictureFirebase!,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.42,
                minChildSize: 0.42,
                maxChildSize: 0.8,
                builder: (context, controller) {
                  return Container(
                    // ignore: sort_child_properties_last
                    child: ListView(
                      controller: controller,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 30.0,
                          ),
                          child: Text(product.description!,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 30.0,
                          ),
                          child: Text("About this machine",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10, right: 30),
                          child: Text(
                              "The Lelit Bianca is a dual boiler, rotary pump, E61 espresso machine with a built-in PID, and shot timer that can be direct plumbed or run on its built-in reservoir. It also comes with a factory fitted flow control device which is the same as the walnut wood accents of the valves.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomDropdownRow(
                            title: 'What\'s include',
                            componentsList: [
                              CustomRowComponent(
                                  title: 'San Remo YOU Coffee Machine',
                                  value: 'x1'),
                              CustomRowComponent(
                                  title: 'Portafilters (Single & Double)',
                                  value: 'x2'),
                              CustomRowComponent(
                                  title: 'Set IMS baskets ', value: 'x1'),
                              CustomRowComponent(
                                  title: 'SR Metal Tamper', value: 'x1'),
                            ],
                            initiallyExpanded: true,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                          ),
                          child: Text("Other Products",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            height: 225.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _productController.productsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return OtherProductCard(
                                    productList:
                                        _productController.productsList[index]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(25)),
                  );
                }),
            Positioned(
                top: 25,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/back.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
