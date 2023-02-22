import 'package:coffee_roastery/components/image_slider.dart';
import 'package:coffee_roastery/components/main_button.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/screens/products/coffee_details_page.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:coffee_roastery/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/coffee_product_controller.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final inputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _coffeeProductList = Get.put(CoffeeProductController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                alignment: Alignment.center,
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  controller: inputController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    int index = _coffeeProductList.coffeeProductsList
                        .indexWhere((item) => item.code == value);

                    Get.off(CoffeeDetailsPage(
                        coffeeProduct:
                            _coffeeProductList.coffeeProductsList[index]));
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: AppTheme.textColor),
                      hintText: 'Search Products',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintStyle: TextStyle(
                          color: AppTheme.textColor,
                          fontFamily: 'SF Pro Display')),
                ),
                // onChanged: (text) {
                //   text = text.toLowerCase();
                //   filter(text);
                // },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      int index = _coffeeProductList.coffeeProductsList
                          .indexWhere(
                              (item) => item.code == inputController.text);
                      Get.off(CoffeeDetailsPage(
                          coffeeProduct:
                              _coffeeProductList.coffeeProductsList[index]));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: AppTheme.textColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text('Search',
                          style: TextStyle(
                              color: Color(0xFFDAB68C),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: 'SF Pro Display')),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: (() {
                      Get.to(MyHomePage());
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: AppTheme.textColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text('Home Page',
                          style: TextStyle(
                              color: Color(0xFFDAB68C),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: 'SF Pro Display')),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background8.jpg'))),
        ),
      ),
    );
  }
}
