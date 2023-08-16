import 'package:flutter/material.dart';
import 'package:second_layout/screen/chuyen_tai_khoan/chuyen_tai_khoan_screen.dart';
import 'package:second_layout/screen/me/don_dat_hang/don_dat_hang.dart';
import 'package:second_layout/screen/me/ten_nguoi_dung/chinh_sua_ten_nguoi_dung.dart';
import 'package:second_layout/screen/me/dark_mode/dark_mode.dart';
import 'package:second_layout/screen/me/trang_thai_hoat_dong/trang_thai_hoat_dong.dart';
import 'package:flutter/services.dart';
class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeigt = MediaQuery.of(context).size.height;

    bool light = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Tôi', style: TextStyle(fontWeight: FontWeight.bold
        ,color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      height: maxHeigt * 0.2,
                      width: maxWidth * 0.4,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage('https://i.imgur.com/sinZa9i.jpeg'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.black12,
                            ),
                            height: 60,
                            width: 60,
                            child: const Icon(Icons.camera_alt),
                          ),
                        )

                    )
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text('Hoàng Phúc', style: TextStyle(color: Colors.black,
                fontSize: 23, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Tài khoản', style: TextStyle(color: Colors.grey
                  ,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://i.imgur.com/sinZa9i.jpeg'),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phúc Hoàng'),
                    Text('Đã đăng nhập', style: TextStyle(color: Colors.grey),),
                  ],
                ),
                trailing: InkWell(
                    onTap: (){

                    },
                    child: const Icon(Icons.check)),
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
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
                title: const Text('Quản lý tài khoản'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const ChuyenTaiKhoan()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Trang cá nhân', style: TextStyle(color: Colors.grey
                  ,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SettingScreen()),
                  );
                },
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.nights_stay, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chế độ tối'),
                    Text('Tắt', style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => const TrangThaiHoatDong()));
                },
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.bubble_chart, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trạng thái hoạt động'),
                    Text('Đang bật', style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              ListTile(
                onTap: (){
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: maxHeigt*0.25,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 23),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('m.me/shinderu52'),
                                    TextButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.close))
                                  ],
                                ),
                              ),
                              ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder:
                                  (context) => ChinhSuaTenNguoiDung()));

                                },
                                leading: Icon(Icons.person),
                                title: Text('Chỉnh sửa tên người dùng'),
                              ),
                              ListTile(
                                onTap: () async {
                                  await Clipboard.setData(
                                      ClipboardData(text: 'm.me/shinderu52'));
                                },
                                leading: Icon(Icons.copy),
                                title: Text('Sao chép liên kết'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.attachment, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tên người dùng'),
                    Text('m.me/shinderu52', style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Dịch vụ', style: TextStyle(color: Colors.grey
                  ,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => DonDatHang()));
                },
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.shopping_bag, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Đơn đặt hàng'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Tuỳ chọn', style: TextStyle(color: Colors.grey
                  ,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.notifications, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Thông báo & âm thanh'),
                  ],
                ),
              ),
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.key_rounded, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quyền riêng tư & an toàn'),
                  ],
                ),
              ),

              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.emoji_emotions, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Avatar'),
                  ],
                ),
              ),
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF698BEA),
                  child: Icon(Icons.data_thresholding, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trình tiết kiệm dữ liệu'),
                  ],
                ),
              ),
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.image, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ảnh & file phương tiện'),
                  ],
                ),
              ),

              SwitchListTile(
                value: light,
                onChanged: (bool? value) {
                  setState(() {
                    light = value!;
                  });
                },
                title: const Text('Bong bóng chat'),
                secondary: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.bubble_chart_rounded, color: Colors.white,),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('An toàn', style: TextStyle(color: Colors.grey
              ,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.deepOrange,
                  child: Icon(Icons.warning, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Báo cáo sự cố kỹ thuật'),
                  ],
                ),
              ),
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.question_mark_sharp, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trợ giúp'),
                  ],
                ),
              ),
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.fact_check_outlined, color: Colors.white,),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pháp lý & chính sách'),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
