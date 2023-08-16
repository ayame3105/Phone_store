import 'package:flutter/material.dart';

class TrangThaiHoatDong extends StatefulWidget {
  const TrangThaiHoatDong({super.key});

  @override
  State<TrangThaiHoatDong> createState() => _TrangThaiHoatDongState();
}

class _TrangThaiHoatDongState extends State<TrangThaiHoatDong> {
  bool light1 = true;
  bool light2 = false;
  @override
  Widget build(BuildContext context) {
    final maxHeigh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Trạng thái hoạt động',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        height: maxHeigh*0.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SwitchListTile(
              value: light1,
              onChanged: (bool? value) {
                setState(() {
                  light1 = value!;
                });
              },
              title: const Text('Hiển thị khi bạn hoạt động'),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.grey),
                    text:
                        'Bạn bè và các mối quan hệ kết nối có thể biết khi nào bạn đang hoạt động hoặc hoạt động gần đây trên trang cá nhân này. Bạn cũng có thể xem thông tin này về họ. Nếu bạn muốn thay đổi cài đặt này thì hãy tắt đi mỗi khi dùng Messenger hoặc Facebook để trạng thái hoạt động của bạn không hiển thị nữa. ',
                    children: [
                      TextSpan(
                        style: TextStyle(color: Colors.blue),
                        text: 'Tìm hiểu thêm',
                      )
                    ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text('Bạn vẫn có thể sử dụng dịch vụ của chúng tôi nếu tắt trạng thái hoạt động',
              style: TextStyle(color: Colors.grey),),
            ),
            SwitchListTile(
              value: light2,
              onChanged: (bool? value) {
                setState(() {
                  light2 = value!;
                });
              },
              title: const Text('Hiển thị khi các bạn cùng đang hoạt động'),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.grey),
                    text:
                    'Bạn bè và quan hệ kết nối có thể biết khi nào bạn đang cùng hoạt động với họ trên Messenger. Bạn cũng có thể thấy khi nào họ cùng hoạt động với bạn. Ví dụ: họ có thể biết khi nào các bạn cùng hoạt động trong một đoạn chat.',
                    children: [
                      TextSpan(
                        style: TextStyle(color: Colors.blue),
                        text: 'Tìm hiểu thêm',
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
