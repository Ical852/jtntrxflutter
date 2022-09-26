import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class MoneyDropdownItem extends StatelessWidget {
  String type;
  Function() onPress;

  MoneyDropdownItem({required this.type, required this.onPress});

  String renderIcon() {
    if (type == 'IDR') {
      return "assets/icrp.png";
    } else if (type == 'USD') {
      return "assets/icdollar.png";
    } else if (type == "EUR") {
      return "assets/iceuro.png";
    } else if (type == "SGD") {
      return "assets/icsdollar.png";
    } else {
      return "assets/icrp.png";
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 12
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(renderIcon())
                )
              ),
            ),
            SizedBox(width: 8,),
            Text(
              type,
              style: robototext.copyWith(
                fontSize: 10,
                fontWeight: bold,
                color: grey
              ),
            ),
          ],
        )
      ),
    );
  }
}