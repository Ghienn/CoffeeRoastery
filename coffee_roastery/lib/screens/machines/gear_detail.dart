import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../theme.dart';
import '../customDropdownRow.dart';
import '../customRowComponent.dart';

class GearDetailsPage extends StatefulWidget {
  @override
  _GearDetailsPageState createState() => _GearDetailsPageState();
}

class _GearDetailsPageState extends State<GearDetailsPage> {
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
                child: Image.asset('assets/machine1.webp',
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
                            top: 30.0,
                          ),
                          child: Text("Black Lelit Bianca V3",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 30.0,
                          ),
                          child: Text("About this machine",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10, right: 30),
                          child: Text(
                              "The Lelit Bianca is a dual boiler, rotary pump, E61 espresso machine with a built-in PID, and shot timer that can be direct plumbed or run on its built-in reservoir. It also comes with a factory fitted flow control device which is the same as the walnut wood accents of the valves.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomDropdownRow(
                            title: 'What\'s include',
                            componentsList: [
                              CustomRowComponent(
                                  title: 'San Remo YOU Coffee Machine',
                                  value: 'x1'),
                              CustomRowComponent(
                                  title: 'Portafilters (Single & Double)',
                                  value: 'x2'),
                              CustomRowComponent(
                                  title: 'Set IMS baskets ', value: 'x1'),
                              CustomRowComponent(
                                  title: 'SR Metal Tamper', value: 'x1'),
                            ],
                            initiallyExpanded: true,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
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
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return _gearListCard('assets/machine1.webp');
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

  _gearListCard(String imgPath) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => GearDetailsPage()));
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
                                    image: AssetImage(imgPath),
                                    fit: BoxFit.fill))))
                  ]),
                ],
              ))),
    );
  }
}
