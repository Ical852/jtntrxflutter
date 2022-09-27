import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class BtnSubmit extends StatelessWidget {
  Function() onPress;
  bool secondary;

  BtnSubmit({required this.onPress, this.secondary = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 111,
        height: 30,
        decoration: BoxDecoration(
          color: secondary ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            "Submit",
            style: robototext.copyWith(
              fontSize: 12,
              fontWeight: bold,
              color: secondary ? white : primaryColor
            ),
          ),
        ),
      ),
    );
  }
}