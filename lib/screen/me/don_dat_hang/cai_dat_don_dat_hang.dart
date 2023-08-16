import 'package:flutter/material.dart';

class CatDatDonDatHang extends StatefulWidget {
  const CatDatDonDatHang({super.key});

  @override
  State<CatDatDonDatHang> createState() => _CatDatDonDatHangState();
}

class _CatDatDonDatHangState extends State<CatDatDonDatHang> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Tính năng được cá nhân hoá', style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: 70,
              child: SwitchListTile(
                value: light,
                onChanged: (bool? value) {
                  setState(() {
                    light = value!;
                  });
                },
                title: const Text('Cho phép đối với đơn đặt hàng và cuộc hẹn'),

              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Cho phép Meta cung cấp các tính năng được cá nhân hoá cho đơn đặt hàng và cuộc hẹn dựa trên cuộc trò chuyện giữa bạn và doanh nghiệp',
            style: TextStyle(color: Colors.grey),)


          ],
        ),
      ),
    );
  }
}
