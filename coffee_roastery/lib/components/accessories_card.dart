import 'package:coffee_roastery/screens/machines/gear_detail.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:flutter/material.dart';

import '../screens/accessories/accessories_details_page.dart';

class AccessoriesCard extends StatelessWidget {
  const AccessoriesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AccessoriesDetailsPage()));
      },
      child: Container(
        height: 150,
        width: 400.0,
        decoration: BoxDecoration(
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
                  borderRadius: BorderRadius.circular(14),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/accessories.webp'))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   margin: const EdgeInsets.all(8.0),
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     color: AppTheme.secondaryColor.withOpacity(.7),
                  //   ),
                  //   child: const Text(
                  //     'Discover',
                  //     style: TextStyle(color: Colors.white, fontSize: 16),
                  //   ),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 10.0),
                    child: Text(
                      'Eureka Digital Scales with Bluetooth',
                      maxLines: 3,
                      style: TextStyle(
                          color: AppTheme.textColor,
                          fontSize: 16,
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
    );
  }
}
