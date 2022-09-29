import 'package:flutter/material.dart';
import 'package:jtntrx/models/trxoutletmodel.dart';
import 'package:jtntrx/shared/theme.dart';

class TrixItems extends StatelessWidget {
  TrxOutletModel trxdata;
  Function() onPress;

  TrixItems({required this.trxdata, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 20
        ),
        padding: EdgeInsets.all(16),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.3),
                blurRadius: 4,
                offset: Offset(0, 3))
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transaksi " + trxdata.trxPtipeNama,
              style: robototext.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text(
                  "Nama Asal Outlet = ",
                  style: robototext.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                    color: black
                  ),
                ),
                Text(
                  trxdata.trxAsalOutletNama,
                  style: robototext.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                    color: primaryColor
                  ),
                ),
              ],
            ),
            SizedBox(height: 6,),
            Expanded(
              child: Text(
                trxdata.trxKet,
                maxLines: 2,
                style: robototext.copyWith(
                  fontSize: 14,
                  fontWeight: light,
                  color: grey,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trxdata.trxCurtipeVar + " " + formatter(int.parse(trxdata.trxNominal)),
                  style: robototext.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                    color: primaryColor
                  ),
                ),
                Text(
                  "Tanggal = " + trxdata.trxTgl,
                  style: robototext.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                    color: primaryColor
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}