import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/screens/products/coffee_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OtherCoffeeCard extends StatelessWidget {
  final CoffeeProductList coffeeProductList;
  const OtherCoffeeCard({Key? key, required this.coffeeProductList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CoffeeDetailsPage(
                  coffeeProduct: coffeeProductList,
                )));
      },
      child: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFB68E72),
              ),
              height: 100.0,
              width: 150.0,
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    Positioned(
                      top: 160,
                      child: Container(
                        height: 100,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              coffeeProductList.description!,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Bean: ${coffeeProductList.bean!}",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            // Text(
                            //   "Origin: ${coffeeProductList.origin!}",
                            //   // ignore: prefer_const_constructors
                            //   style: TextStyle(
                            //       fontFamily: 'SF Pro Display',
                            //       fontSize: 12.0,
                            //       fontWeight: FontWeight.w500,
                            //       color: Colors.white),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 200.0),
                    Positioned(
                        top: 0.0,
                        child: Container(
                            height: 150.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        coffeeProductList.pictureFirebase!),
                                    fit: BoxFit.fill))))
                  ]),
                ],
              ))),
    );
  }
}
