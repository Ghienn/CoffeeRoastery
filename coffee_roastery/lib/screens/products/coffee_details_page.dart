import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import '../../models/note_list.dart';
import '../../theme.dart';
import '../customDropdownRow.dart';
import '../customRowComponent.dart';

class CoffeeDetailsPage extends StatelessWidget {
  final CoffeeProductList coffeeProduct;
  CoffeeDetailsPage({Key? key, required this.coffeeProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          coffeeProduct.pictureFirebase!,
                        ),
                        fit: BoxFit.cover),
                  )),
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
                            top: 20.0,
                            right: 30.0,
                          ),
                          child: Text(coffeeProduct.description!,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomDropdownRow(
                            title: 'Source',
                            componentsList: [
                              CustomRowComponent(
                                  title: 'Bean', value: coffeeProduct.bean!),
                              CustomRowComponent(
                                  title: 'Origin',
                                  value: coffeeProduct.origin!),
                              CustomRowComponent(
                                  title: 'Farm', value: coffeeProduct.farm!),
                              CustomRowComponent(
                                  title: 'Altitude',
                                  value:
                                      '${coffeeProduct.altitudeFrom!} - ${coffeeProduct.altitudeTo!}'),
                              CustomRowComponent(
                                  title: 'Varietal',
                                  value: coffeeProduct.varietal!)
                            ],
                            initiallyExpanded: false,
                          ),
                        ),
                        CustomDropdownRow(
                          title: 'Processing Method',
                          componentsList: [
                            CustomRowComponent(
                                title: 'Process', value: 'Honey'),
                            CustomRowComponent(
                                title: 'Grade', value: coffeeProduct.grade!),
                          ],
                          initiallyExpanded: false,
                        ),
                        CustomDropdownRow(
                          title: 'Roast',
                          componentsList: [
                            CustomRowComponent(
                                title: 'Roast Date',
                                value: coffeeProduct.roastDate!),
                            CustomRowComponent(
                                title: 'Roast Purpose',
                                value: coffeeProduct.roastPurpose!),
                          ],
                          initiallyExpanded: false,
                        ),
                        CustomDropdownRow(
                          title: 'Notes',
                          componentsList: [
                            CustomRowComponent(
                                title: 'Note',
                                value: 'noteList.noteDescription!'),
                          ],
                          initiallyExpanded: false,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 10.0,
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
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return _coffeeProductListCard(
                                    'https://i.postimg.cc/x1XkHr69/VI-Coffee-Product-1.png');
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

  _coffeeProductListCard(String imgPath) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => CoffeeDetailsPage()));
      // },
      child: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Container(
              height: 200.0,
              width: 150.0,
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    Container(height: 200.0),
                    Positioned(
                        top: 0.0,
                        child: Container(
                            height: 200.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                    image: NetworkImage(imgPath),
                                    fit: BoxFit.fill))))
                  ]),
                ],
              ))),
    );
  }
}
