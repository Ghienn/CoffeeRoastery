import 'package:coffee_roastery/components/coffee_bean_card.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/screens/accessories/accessories_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/coffee_tool.dart';

class OtherToolCard extends StatelessWidget {
  final CoffeeToolList coffeeTool;
  const OtherToolCard({Key? key, required this.coffeeTool}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AccessoriesDetailsPage(
                  coffeeTool: coffeeTool,
                )));
      },
      child: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Container(
              height: 150.0,
              width: 150.0,
              child: Column(
                children: <Widget>[
                  Stack(children: [
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
                                        coffeeTool.pictureFirebase!),
                                    fit: BoxFit.fill))))
                  ]),
                ],
              ))),
    );
  }
}
