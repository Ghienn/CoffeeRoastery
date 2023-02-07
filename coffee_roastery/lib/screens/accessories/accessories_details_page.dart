import 'package:coffee_roastery/controller/coffee_tool_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import '../../theme.dart';

class AccessoriesDetailsPage extends StatefulWidget {
  @override
  _AccessoriesDetailsPageState createState() => _AccessoriesDetailsPageState();
}

class _AccessoriesDetailsPageState extends State<AccessoriesDetailsPage> {
  final _coffeeToolController = Get.put(CoffeeToolController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                // height: 550.0,
                // width: double.infinity,
                child: Image.asset('assets/accessories.webp',
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.42,
                minChildSize: 0.42,
                maxChildSize: 0.8,
                builder: (context, controller) {
                  return Container(
                    // ignore: sort_child_properties_last
                    child: ListView(
                      controller: controller,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                            right: 30.0,
                          ),
                          child: Text("Acaia Lunar Espresso Scales Black 2021",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                            right: 30.0,
                          ),
                          child: Text("Description",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10, right: 30),
                          child: Text(
                              "Reintroducing the essential Lunar scale, now with brand new abilities and features! This includes our latest weighing technology, a faster response time, a built-in Flow-Rate Indicator, USB-C charging, and a brighter display for seamless daily use. The scale still has all the familiar features you love, including several auto-start modes, 0.1 g accuracy, and a rechargeable battery with more than 30 hours of life. Great reliability and accuracy, we use the lunar scales daily to help dial in our espresso extraction ratios, i.e. 2:1 18g dry to 36g wet within 25-30 seconds for our medium roast coffee, from our small batch coffee roastery. The low profile helps with cup clearance on the majority of the espresso machines that we sell here at Bella Barista.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Color.fromARGB(255, 143, 128, 122),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 10.0,
                          ),
                          child: Text("Other Products",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            height: 225.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _coffeeToolController.coffeeToolList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _accessoriesgearListCard(
                                    _coffeeToolController.coffeeToolList[index]
                                        .pictureFirebase!);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(25)),
                  );
                }),
            Positioned(
                top: 25,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/back.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _accessoriesgearListCard(String imgPath) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AccessoriesDetailsPage()));
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
                            height: 200.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                    image: NetworkImage(imgPath),
                                    fit: BoxFit.fill))))
                  ]),
                ],
              ))),
    );
  }
}
