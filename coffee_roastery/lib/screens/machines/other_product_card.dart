import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/theme.dart';
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
          padding: EdgeInsets.only(right: 15.0, top: 5, bottom: 10),
          child: Container(
              // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: const Offset(3, 5),
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 145,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(productList.pictureFirebase!))),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 8, left: 15, right: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        productList.description!,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkColor,
                            fontFamily: 'SF Pro Display'),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
