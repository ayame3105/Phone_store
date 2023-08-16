import 'package:flutter/material.dart';
import 'package:second_layout/screen/navigation_drawer/navigation_bar_drawer.dart';

class DoanChat extends StatelessWidget {
  const DoanChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Đoạn chat', style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Đoạn chat sẽ hiển thị ở đây'),
          ],
        ),
      ),
    );
  }
}
