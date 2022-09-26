import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class BtnSubmit extends StatelessWidget {
  Function() onPress;

  BtnSubmit({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 111,
        height: 30,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            "Submit",
            style: robototext.copyWith(
              fontSize: 12,
              fontWeight: bold,
              color: primaryColor
            ),
          ),
        ),
      ),
    );
  }
}