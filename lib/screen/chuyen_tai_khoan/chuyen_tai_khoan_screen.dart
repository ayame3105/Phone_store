import 'package:flutter/material.dart';
import 'package:second_layout/screen/login/login.dart';
import 'package:second_layout/screen/me/me.dart';

class ChuyenTaiKhoan extends StatelessWidget {
  const ChuyenTaiKhoan({super.key});

  @override
  Widget build(BuildContext context) {

    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text('Chuyển tài khoản',
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ListTile(
              onTap: (){},
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://i.imgur.com/sinZa9i.jpeg'),
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phúc Hoàng', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Trang cá nhân'),
                ],
              ),
            ),
            ListTile(
              onTap: (){},
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://i.imgur.com/zXbOiC1.png'),
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aether Gazer Việt Nam'),
                  Text('Trang của bạn có 2 đoạn chat chưa đọc',
                    style: TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => const Login()));
              },
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(Icons.add, color: Colors.black,),
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Thêm tài khoản'),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                  ),
                  width: maxWidth * 0.9,
                  child: TextButton(
                      onPressed: (){
                        print('Click');
                      },
                      child: const Text('TẠO TÀI KHOẢN MỚI',style: TextStyle(
                        color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
