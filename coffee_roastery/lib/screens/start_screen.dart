import 'package:coffee_roastery/components/image_slider.dart';
import 'package:coffee_roastery/components/main_button.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:coffee_roastery/home_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // child: Column(
        //   children: [
        //     const Spacer(
        //       flex: 2,
        //     ),
        //     SizedBox(
        //       height: size.height / 2,
        //       child: PageView.builder(
        //         controller: controller,
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (context, index) {
        //           return const SingleChildScrollView(child: ImageSlider());
        //         },
        //         itemCount: 3,
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8),
        //       child: SmoothPageIndicator(
        //         controller: controller,
        //         count: 3,
        //         effect: WormEffect(
        //           activeDotColor: AppTheme.textColor,
        //           dotColor: Color(0xFFDAB68C),

        //           dotHeight: 12,
        //           dotWidth: 12,
        //           type: WormType.normal,
        //           // strokeWidth: 5,
        //         ),
        //       ),
        //     ),
        //     const Spacer(),
        //     const MainButton(),
        //     const Spacer(),
        //   ],
        // ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.jpg'))),
      ),
    );
  }
}
