import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class OutletItemName extends StatelessWidget {
  String title;
  Function() onPress;

  OutletItemName({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10
        ),
        child: Text(
          title,
          style: robototext.copyWith(
            fontSize: 12,
            fontWeight: bold,
            color: primaryColor
          ),
        ),
      ),
    );
  }
}