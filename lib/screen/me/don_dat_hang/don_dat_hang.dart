import 'package:flutter/material.dart';
import 'package:second_layout/screen/me/don_dat_hang/cai_dat_don_dat_hang.dart';
import 'package:second_layout/screen/me/don_dat_hang/lich_su_dat_hang.dart';

class DonDatHang extends StatelessWidget {
  const DonDatHang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Đơn đặt hàng', style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => LichSuDatHang()));
                },
                child: Text('Lịch sử đặt hàng', style: TextStyle(color: Colors.black),)),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => CatDatDonDatHang()));
                },
                child: Text('Cài đặt đơn đặt hàng', style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
}
