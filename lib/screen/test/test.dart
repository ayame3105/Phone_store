import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _currentIndex = 0;
  final List<String> _imageList = [
    'assets/images/chao_em.jpg', // Thay đổi đường dẫn của ảnh thứ nhất trong thư mục assets
    'assets/images/thapnhang.jpg',
    'assets/images/ancom.png',
    'assets/images/vai.jpg',
    'assets/images/sleep.jpeg', // Thay đổi đường dẫn của ảnh thứ ba trong thư mục assets

  ];

  final List<String> _captions = [
    'Lâu quá không nhắn tin với em :<', // Thay đổi caption cho ảnh thứ nhất
    'Nay rảnh nhắn nè :))',
    'Em ăn cơm chưa :D',
    'Sorry vi anh nhat vl :<',
    'Thoi ngủ đây bye :3', // Thay đổi caption cho ảnh thứ ba
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: _imageList.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imageList.map((imagePath) {
              int index = _imageList.indexOf(imagePath);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text(
            _captions[_currentIndex], // Hiển thị caption tương ứng với ảnh hiện tại
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 50,),
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new))
        ],
      ),
    );
  }
}
