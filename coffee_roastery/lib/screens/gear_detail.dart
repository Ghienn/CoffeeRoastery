import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../theme.dart';

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
                child: Image.asset('assets/gear5.webp',
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
                                  fontFamily: 'opensans',
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
                                  fontFamily: 'opensans',
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
                                  color: Color.fromARGB(255, 197, 188, 184),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10, right: 30),
                          child: Text("What's Included",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'opensans',
                                  color: AppTheme.textColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10, right: 30),
                          child: Text(
                              "1 x Lelit Bianca Machine\n1 x Bottomless walnut portafilter\n1 x Double spouted walnut portafilter\n1x Lelit stainless steel and aluminum tamper\n1 x Lelit in-tank water softener\n1 x Single basket\n1 x Double basket\n1 x Triple basket\n1 x 2-hole and 4-hole steam tip\n1 x Microfiber towel\n1 x Braided plumb-in line\n1 x Drip tray drain attachment\n1 x Group head brush\n1 x Backflush blank\n1 x Bella Barista Bianca Hand Written Manual",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 197, 188, 184),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'opensans')),
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
