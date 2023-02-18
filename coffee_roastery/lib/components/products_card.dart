import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/screens/products/coffee_details_page.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsCard extends StatelessWidget {
  final CoffeeProductList coffeeProduct;

  const ProductsCard({required this.coffeeProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CoffeeDetailsPage(coffeeProduct: coffeeProduct)));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: 150,
          width: 400.0,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppTheme.textColor.withOpacity(0.2), width: 2.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(3, 5),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: EdgeInsets.all(4),
          margin: const EdgeInsets.only(right: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(6.0),
                width: 125,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //     color: AppTheme.textColor.withOpacity(0.7), width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(coffeeProduct.pictureFirebase!),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 25.0, left: 10.0, right: 10),
                      child: Text(
                        coffeeProduct.description!,
                        maxLines: 1,
                        style: TextStyle(
                            color: AppTheme.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF Pro Display'),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 15.0, left: 10.0, right: 10),
                      child: Text(
                        'Bean: ${coffeeProduct.bean!}',
                        maxLines: 3,
                        style: TextStyle(
                            color: AppTheme.textColor.withOpacity(0.8),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SF Pro Display'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        'Origin: ${coffeeProduct.origin!}',
                        maxLines: 3,
                        style: TextStyle(
                            color: AppTheme.textColor.withOpacity(0.8),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SF Pro Display'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
