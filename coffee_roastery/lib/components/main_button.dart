import 'package:coffee_roastery/theme.dart';
import 'package:coffee_roastery/home_page.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppTheme.textColor, borderRadius: BorderRadius.circular(30)),
        child: const Text('Get Started',
            style: TextStyle(
                color: Color(0xFFDAB68C),
                fontWeight: FontWeight.w700,
                fontSize: 18)),
      ),
    );
  }
}
