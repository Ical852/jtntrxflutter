import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class OutletFuncItem extends StatelessWidget {
  String title;
  Function() onPress;

  OutletFuncItem({required this.title, required this.onPress});

  String renderIcon() {
    return title == "MASUK" ? "assets/icmasuk.png"
    : title == "KELUAR" ? "assets/ickeluar.png"
    : title == "PINDAH" ? "assets/icpindah.png"
    : title == "MUTASI" ? "assets/icmutasi.png"
    : "assets/ickurs.png";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(renderIcon())
                )
              ),
            ),
            SizedBox(height: 4,),
            Text(
              title,
              style: robototext.copyWith(
                fontSize: 8,
                fontWeight: bold,
                color: primaryColor
              ),
            )
          ],
        ),
      ),
    );
  }
}