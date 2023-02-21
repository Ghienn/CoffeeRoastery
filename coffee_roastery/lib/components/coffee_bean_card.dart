import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/product.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:flutter/material.dart';

import '../screens/products/coffee_details_page.dart';
import '../service/networking.dart';

class CoffeeProductCard extends StatelessWidget {
  final CoffeeProductList coffeeProduct;
  final bool isFavorite;

  const CoffeeProductCard(
      {required this.coffeeProduct, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CoffeeDetailsPage(coffeeProduct: coffeeProduct)));
      },
      child: Column(
        children: <Widget>[
          Stack(children: [
            Container(
              height: 280.0,
            ),
            Positioned(
                top: 75.0,
                child: Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    height: 200.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFB68E72)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 110.0,
                          ),
                          Container(
                            height: 25.0,
                            width: 180.0,
                            child: Text(
                              coffeeProduct.description!,
                              maxLines: 1,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 20.0,
                            width: 180.0,
                            child: Text(
                              'Bean: ${coffeeProduct.bean}',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 14.0,
                                  // fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 20.0,
                            width: 180.0,
                            child: Text(
                              'Origin: ${coffeeProduct.origin}',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 14.0,
                                  // fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          )
                        ]))),
            Positioned(
                top: 0.0,
                child: Container(
                    height: 190.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(coffeeProduct.pictureFirebase!),
                            fit: BoxFit.contain))))
          ]),
        ],
      ),
    );
  }
}
