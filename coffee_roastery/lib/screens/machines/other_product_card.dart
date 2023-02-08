import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/product.dart';
import 'gear_detail.dart';

class OtherProductCard extends StatelessWidget {
  final ProductList productList;
  const OtherProductCard({Key? key, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GearDetailsPage(product: productList)));
      },
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
                            height: 180.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        productList.pictureFirebase!),
                                    fit: BoxFit.fill))))
                  ]),
                ],
              ))),
    );
  }
}
