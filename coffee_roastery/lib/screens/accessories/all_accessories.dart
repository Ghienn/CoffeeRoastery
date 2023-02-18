import 'package:coffee_roastery/components/accessories_card.dart';
import 'package:coffee_roastery/custom_search.dart';
import 'package:coffee_roastery/screens/navigation_drawer.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/machine_card.dart';
import '../../controller/coffee_tool_controller.dart';
import '../../home_page.dart';
import '../../models/coffee_tool.dart';
import '../../service/api_handler.dart';

class AllAccessoriesPage extends StatefulWidget {
  @override
  _AllAccessoriesPageState createState() => _AllAccessoriesPageState();
}

class _AllAccessoriesPageState extends State<AllAccessoriesPage> {
  final _coffeeToolController = Get.put(CoffeeToolController());
  final GlobalKey<_AllAccessoriesPageState> _refreshIndicatorKey =
      GlobalKey<_AllAccessoriesPageState>();

  Future<void> AccessoriesListRefresh() async {
    ApiRequest.getCoffeeProduct("0365582274", '1').then((value) {
      List<CoffeeToolList> toolList = value['tools'] ?? <CoffeeToolList>[];
      setState(() {
        _coffeeToolController.coffeeToolList.clear();
        _coffeeToolController.coffeeToolList.addAll(toolList);
      });

      print("Update product tool list");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    AccessoriesListRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SafeArea(child: NavigationDrawerWidget()),
        body: RefreshIndicator(
          color: AppTheme.darkColor,
          key: _refreshIndicatorKey,
          onRefresh: () async {
            await AccessoriesListRefresh();
          },
          child: Builder(builder: (context) {
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
                        'ALL ACCESSORIES',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 32.0,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...List.generate(
                        _coffeeToolController.coffeeToolList.length, (index) {
                      return CoffeeToolCard(
                          coffeeTool:
                              _coffeeToolController.coffeeToolList[index]);
                    }),
                    SizedBox(
                      height: 30,
                    )
                  ]),
            );
          }),
        ));
  }
}
