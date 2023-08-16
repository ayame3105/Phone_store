import 'package:flutter/material.dart';

class LichSuDatHang extends StatelessWidget {
  const LichSuDatHang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Đơn đặt hàng', style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Text('Bạn chưa có đơn đặt hàng nào', style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 23
        ),),
      ),
    );
  }
}
