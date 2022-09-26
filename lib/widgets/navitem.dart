import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class NavItem extends StatelessWidget {
  String title;
  bool active;
  Function() onPress;

  NavItem({required this.title, this.active = false, required this.onPress});

  String renderIcon() {
    if (title == 'HOME') {
      return active ? "assets/ichomeactive.png" : "assets/ichome.png";
    } else if (title == "TRANSAKSI") {
      return active ? "assets/ictrxactive.png" : "assets/ictrx.png";
    } else if (title == "LAPORAN") {
      return active ? "assets/icreportactive.png" : "assets/icreport.png";
    } else if (title == "TOOLS") {
      return active ? "assets/ictoolsactive.png" : "assets/ictools.png";
    } else {
      return active ? "assets/ichomeactive.png" : "assets/ichome.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(renderIcon())
                )
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Opacity(
              opacity: active ? 1 : 0.35,
              child: Text(
                title,
                style: robototext.copyWith(
                  fontSize: 8,
                  fontWeight: bold,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}