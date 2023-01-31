import 'package:coffee_roastery/screens/machines/gear_detail.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:flutter/material.dart';

class MachineCard extends StatelessWidget {
  const MachineCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => GearDetailsPage()));
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
                      image: AssetImage('assets/machine1.webp'))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 10.0),
                    child: Text(
                      'Black Lelit Bianca V3 Dual Boiler Espresso Machine',
                      maxLines: 3,
                      style: TextStyle(
                          color: AppTheme.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'opensans'),
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
