import 'dart:convert';

import 'package:coffee_roastery/controller/coffee_product_controller.dart';
import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home_page.dart';
import '../../models/note_list.dart';
import '../../theme.dart';
import '../customDropdownRow.dart';
import '../customRowComponent.dart';
import 'other_coffee_card.dart';

class CoffeeDetailsPage extends StatelessWidget {
  final CoffeeProductList coffeeProduct;

  final _coffeeProductController = Get.put(CoffeeProductController());
  CoffeeDetailsPage({Key? key, required this.coffeeProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> returnNote() {
      List<String> notes = <String>[];
      for (var note in coffeeProduct.noteList!) {
        notes.add(note.noteDescription!);
      }
      return notes;
    }

    List<String> notelist = returnNote();

    print(notelist);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          coffeeProduct.pictureFirebase!,
                        ),
                        fit: BoxFit.cover),
                  )),
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
                        Padding(
                          // ignore: prefer_const_constructors
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                            right: 30.0,
                          ),
                          child: Text(coffeeProduct.description!,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomDropdownRow(
                            title: 'Source',
                            componentsList: [
                              CustomRowComponent(
                                  title: 'Bean', value: coffeeProduct.bean!),
                              CustomRowComponent(
                                  title: 'Origin',
                                  value: coffeeProduct.origin!),
                              CustomRowComponent(
                                  title: 'Farm', value: coffeeProduct.farm!),
                              CustomRowComponent(
                                  title: 'Altitude',
                                  value:
                                      '${coffeeProduct.altitudeFrom!} - ${coffeeProduct.altitudeTo!}'),
                              CustomRowComponent(
                                  title: 'Varietal',
                                  value: coffeeProduct.varietal!)
                            ],
                            initiallyExpanded: true,
                          ),
                        ),
                        CustomDropdownRow(
                          title: 'Processing Method',
                          componentsList: [
                            CustomRowComponent(
                                title: 'Process',
                                value: coffeeProduct.process!),
                            CustomRowComponent(
                                title: 'Grade', value: coffeeProduct.grade!),
                          ],
                          initiallyExpanded: false,
                        ),
                        CustomDropdownRow(
                          title: 'Roast',
                          componentsList: [
                            CustomRowComponent(
                                title: 'Roast Date',
                                value: coffeeProduct.roastDate!.substring(
                                    0, coffeeProduct.roastDate!.indexOf(' '))),
                            CustomRowComponent(
                                title: 'Roast Purpose',
                                value: coffeeProduct.roastPurpose!),
                          ],
                          initiallyExpanded: false,
                        ),
                        ExpansionTile(
                          title: Text('Notes',
                              style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20)),
                          initiallyExpanded: true,
                          // tilePadding: EdgeInsets.symmetric(horizontal: maxWidth * 0.048),
                          tilePadding: EdgeInsets.symmetric(horizontal: 20),
                          // childrenPadding: EdgeInsets.symmetric(horizontal: 2),
                          textColor: AppTheme.textColor,
                          collapsedTextColor: AppTheme.darkColor,
                          iconColor: AppTheme.darkColor,
                          collapsedIconColor: AppTheme.darkColor,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.045),
                              width: MediaQuery.of(context).size.width,
                              child: Wrap(
                                  spacing: 5.0,
                                  children: List.generate(
                                      coffeeProduct.noteList!.length, (index) {
                                    return Tooltip(
                                      textStyle: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          color: Colors.white),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey[700]!
                                              .withOpacity(0.9)),
                                      message:
                                          'Flavor: ${coffeeProduct.noteList![index].flavorDescription}\nNoteType: ${coffeeProduct.noteList![index].noteTypeDescription}',
                                      preferBelow: false,
                                      showDuration: Duration(seconds: 3),
                                      triggerMode: TooltipTriggerMode.tap,
                                      waitDuration: Duration(seconds: 0),
                                      child: Chip(
                                        side: BorderSide(
                                            width: 1.0,
                                            color: AppTheme.dividerColor),
                                        backgroundColor: Color(
                                          int.parse(
                                              'FF' +
                                                  coffeeProduct.noteList![index]
                                                      .noteHexColor!,
                                              radix: 16),
                                        ),
                                        labelStyle: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 16,
                                            color:
                                                Colors.black.withOpacity(0.7)),
                                        label: Text(coffeeProduct
                                            .noteList![index].noteDescription!),
                                        avatar: Icon(
                                          Icons.info_outline,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  })),
                            )
                          ],
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
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 20),
                          child: Container(
                            height: 225.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _coffeeProductController
                                  .coffeeProductsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return OtherCoffeeCard(
                                    coffeeProductList: _coffeeProductController
                                        .coffeeProductsList[index]);
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
                    Get.off(MyHomePage());
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

// class MyTooltip extends StatelessWidget {
//   final Widget child;
//   final String message;

//   MyTooltip({required this.child, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     final key = GlobalKey<State<Tooltip>>();
//     return Tooltip(
      
//       preferBelow: false,
//       triggerMode: TooltipTriggerMode.tap,
//       key: key,
//       message: message,
//       child: GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () => _onTap(key),
//         child: child,
//       ),
//     );
//   }

//   void _onTap(GlobalKey key) {
//     final dynamic tooltip = key.currentState;
//     tooltip?.ensureTooltipVisible();
//   }
// }
