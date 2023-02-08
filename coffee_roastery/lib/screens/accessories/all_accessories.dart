import 'package:coffee_roastery/components/accessories_card.dart';
import 'package:coffee_roastery/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/machine_card.dart';
import '../../controller/coffee_tool_controller.dart';
import '../../home_page.dart';

class AllAccessoriesPage extends StatefulWidget {
  @override
  _AllAccessoriesPageState createState() => _AllAccessoriesPageState();
}

class _AllAccessoriesPageState extends State<AllAccessoriesPage> {
  final _coffeeToolController = Get.put(CoffeeToolController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(padding: EdgeInsets.only(left: 20.0), children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
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
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: CustomSearch());
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
        ...List.generate(_coffeeToolController.coffeeToolList.length, (index) {
          return CoffeeToolCard(
              coffeeTool: _coffeeToolController.coffeeToolList[index]);
        }),
        SizedBox(
          height: 30,
        )
      ]),
    ));
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Arabica',
    'Culi',
    'Cherry',
    'Moka',
    'Robusta',
    'Espresso',
    'Cappuccino',
    'Macchiato',
    'Latte'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }));
  }
}
