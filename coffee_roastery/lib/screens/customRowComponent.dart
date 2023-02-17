import 'package:flutter/material.dart';

import '../theme.dart';

class CustomRowComponent extends StatefulWidget {
  String title;
  String value;
  bool? enabled;

  CustomRowComponent({
    Key? key,
    required this.title,
    required this.value,
    this.enabled = false,
  }) : super(key: key);

  @override
  State<CustomRowComponent> createState() => _CustomRowComponentState();
}

class _CustomRowComponentState extends State<CustomRowComponent> {
  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    final double maxHeight = MediaQuery.of(context).size.height;

    String title = widget.title;
    dynamic value = widget.value;
    bool? enabled = widget.enabled;

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(left: maxWidth * 0.048),
        child: const Divider(
          height: 1,
          thickness: 1,
          indent: 0,
          endIndent: 20,
          color: AppTheme.dividerColor,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: maxWidth * 0.048, vertical: maxHeight * 0.015),
        width: maxWidth,
        height: maxHeight * (50 / 790),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppTheme.textColor.withOpacity(0.7),
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500)),
            Flexible(
              child: Container(
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppTheme.textColor.withOpacity(0.7),
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
