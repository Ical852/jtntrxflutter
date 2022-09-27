import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class OutletBtn extends StatelessWidget {
  String title;
  Function() onPress;
  bool opened;
  bool secondary;

  OutletBtn({required this.title, required this.onPress, this.opened = false, this.secondary = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 13
        ),
        height: 30,
        decoration: BoxDecoration(
          color: secondary ? white : secondaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2), blurRadius: 3, offset: Offset(0, 3))
          ]
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: robototext.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                  color: primaryColor
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10
                ),
                width: 7,
                height: 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(opened ? "assets/icup.png" : "assets/icdrop.png")
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}