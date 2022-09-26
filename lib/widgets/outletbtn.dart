import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class OutletBtn extends StatelessWidget {
  String title;
  Function() onPress;
  bool opened;

  OutletBtn({required this.title, required this.onPress, this.opened = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 108,
        height: 30,
        decoration: BoxDecoration(
          color: secondaryColor,
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