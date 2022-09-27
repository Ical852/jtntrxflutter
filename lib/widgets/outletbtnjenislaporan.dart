import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class OutletBtnJenisLaporan extends StatelessWidget {
  String date1, date2, title;
  Function() onPress;
  bool opened;

  OutletBtnJenisLaporan({
    required this.date1, 
    required this.date2, 
    required this.onPress, 
    this.opened = false,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 252,
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
                title + "   ",
                style: robototext.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                  color: primaryColor
                ),
              ),
              Text(
                date1 + " - " + date2,
                style: robototext.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
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