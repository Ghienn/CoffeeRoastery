import 'package:flutter/widgets.dart';

import '../theme.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // Image.asset(
        //   'assets/logo.png',
        //   width: size.width / 1.6,
        // ),
        SizedBox(
          height: 280,
          width: size.width / 1.6,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2.0),
          child: Text(
            'Coffee so good,\n your taste buds with love',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: AppTheme.textColor,
                fontFamily: 'SF Pro Display'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 8,
          ),
          child: Text(
            'The best grain, the finest roast, the most powerful flavor',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.textColor,
                fontFamily: 'SF Pro Display'),
          ),
        ),
      ],
    );
  }
}
