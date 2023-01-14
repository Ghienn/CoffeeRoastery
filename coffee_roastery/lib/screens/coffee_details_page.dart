import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../theme.dart';

class CoffeeDetailsPage extends StatefulWidget {
  @override
  _CoffeeDetailsPageState createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
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
                child: Image.asset('assets/driven.jpg',
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
                            left: 30.0,
                            top: 20.0,
                            right: 30.0,
                          ),
                          child: Text("NAVIGATOR - OUR BOLD BLEND",
                              style: TextStyle(
                                  fontFamily: 'serifa',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                            top: 20.0,
                            right: 30.0,
                          ),
                          child: Text("Description",
                              style: TextStyle(
                                  fontFamily: 'serifa',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, top: 10, bottom: 10, right: 30),
                          child: Text(
                              "In homage to the old school explorers, Navigator is a darker, heavier blend developed to go great with milk. Its deep notes of toffee and bitter chocolate are complimented by a subtle cherry sweetness.\n\nA portion of the sales from Navigator goes to support the Jack Fleckney Foundation, which supports disadvantaged young people.\n\nOrigin: Peru El Oso (washed) / Honduras Liquidambar (washed) / Colombia Caficauca (washed)\n\nProducer: Agraria Frontera San Ignacio Cooperative, Gonzales family, Caficauca Cooperative\n\nVarietal: Bourbon, Catimor, Pache, Typica, Caturra, Lempira\n\nCertification: Organic\n\nBest Results: Espresso",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'opensans',
                                  color: Color.fromARGB(255, 143, 128, 122),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),
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
}
