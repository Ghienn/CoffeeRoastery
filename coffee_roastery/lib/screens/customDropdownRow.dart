import 'package:flutter/material.dart';
import '../theme.dart';

class CustomDropdownRow extends StatefulWidget {
  String title;
  List<Widget> componentsList;
  bool initiallyExpanded;

  CustomDropdownRow({
    Key? key,
    required this.title,
    required this.componentsList,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  State<CustomDropdownRow> createState() => _CustomDropdownRowState();
}

class _CustomDropdownRowState extends State<CustomDropdownRow> {
  @override
  Widget build(BuildContext context) {
    // final double maxWidth = MediaQuery.of(context).size.width;
    // final double maxHeight = MediaQuery.of(context).size.height;

    String title = widget.title;
    List<Widget> componentsList = widget.componentsList;
    bool initiallyExpanded = widget.initiallyExpanded;

    return ExpansionTile(
      title: Text(title,
          style: const TextStyle(
              fontFamily: 'SF Pro Display',
              color: AppTheme.darkColor,
              fontWeight: FontWeight.w700,
              fontSize: 25)),
      initiallyExpanded: initiallyExpanded,
      // tilePadding: EdgeInsets.symmetric(horizontal: maxWidth * 0.048),
      tilePadding: EdgeInsets.symmetric(horizontal: 20),
      childrenPadding: EdgeInsets.symmetric(horizontal: 2),
      textColor: AppTheme.textColor,
      collapsedTextColor: AppTheme.darkColor,
      iconColor: AppTheme.darkColor,
      collapsedIconColor: AppTheme.darkColor,
      children: componentsList,
    );
  }
}
