import 'package:coffee_roastery/screens/machines/gear_detail.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:flutter/material.dart';

import '../models/coffee_tool.dart';
import '../screens/accessories/accessories_details_page.dart';

class CoffeeToolCard extends StatelessWidget {
  final CoffeeToolList coffeeTool;
  const CoffeeToolCard({
    Key? key,
    required this.coffeeTool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                AccessoriesDetailsPage(coffeeTool: coffeeTool)));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
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
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(coffeeTool.pictureFirebase!))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 15.0, left: 10.0, right: 10),
                      child: Text(
                        coffeeTool.description!,
                        maxLines: 3,
                        style: TextStyle(
                            color: AppTheme.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
