import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../custom_search.dart';
import '../theme.dart';
import 'navigation_drawer.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SafeArea(child: NavigationDrawerWidget()),
        body: Builder(builder: (context) {
          return SafeArea(
            child: ListView(
                padding: EdgeInsets.only(left: 20.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 0.0),
                              child: Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/menu.png'),
                                      fit: BoxFit.cover),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              showSearch(
                                  context: context, delegate: SearchPage());
                            },
                            child: Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/search.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'ABOUT US',
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 32.0,
                          color: AppTheme.darkColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 20),
                    child: Image(
                      image: AssetImage('assets/sidebar.png'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 20, bottom: 20),
                    child: Text(
                      'Two species of coffee plants, Coffea arabica and C. canephora, supply almost all of the world’s consumption. Arabica is considered a milder and more flavourful and aromatic brew than Robusta, the main variety of C. canephora. The flatter and more elongated Arabica bean is more widespread than Robusta but more delicate and vulnerable to pests, requiring a cool subtropical climate; Arabica must grow at higher elevations (2,000–6,500 feet [600–2,000 metres]), it needs a lot of moisture, and it has fairly specific shade requirements. Latin America, eastern Africa, Asia, and Arabia are leading producers of Arabica coffee. The rounder, more convex Robusta bean, as its name suggests, is hardier and can grow at lower altitudes (from sea level to 2,000 feet). Robusta coffee is cheaper to produce, has twice the caffeine content of Arabica, and is typically the bean of choice for inexpensive commercial coffee brands. Western and Central Africa, Southeast Asia, and Brazil are major producers of Robusta coffee.',
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18.0,
                          color: AppTheme.darkColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ]),
          );
        }));
  }
}
