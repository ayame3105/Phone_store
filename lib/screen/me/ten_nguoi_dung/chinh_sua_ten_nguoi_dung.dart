import 'package:flutter/material.dart';

class ChinhSuaTenNguoiDung extends StatelessWidget {
  const ChinhSuaTenNguoiDung({super.key});

  @override
  Widget build(BuildContext context) {
    final maxHeigh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Tên người dùng',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'LƯU',
                    style: TextStyle(color: Colors.blue,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: maxHeigh*0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLength: 30,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
                decoration: const InputDecoration(
                    labelText: 'Tên người dùng',
                    hintText: 'Nhập tên cần đổi'),
              ),
              const Text('Tên người dùng của bạn sẽ trở thành một phần trong liên kết tuỳ chỉnh. Với liên kết này, mọi người có thể đi đến trang cá nhân Facebook của bạn hay liên hệ với bạn trên Messerger.',
              style: TextStyle(color: Colors.grey),),
              RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.grey),
                    text:
                    'Bạn cần trợ giúp ư? ',
                    children: [
                      TextSpan(
                        style: TextStyle(color: Colors.blue),
                        text: 'Xem mẹo chọn tên người dùng',
                      )
                    ]),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
