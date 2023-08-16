import 'package:flutter/material.dart';
import 'package:second_layout/screen/chuyen_tai_khoan/chuyen_tai_khoan_screen.dart';
import 'package:second_layout/screen/me/me.dart';
import 'package:second_layout/screen/navigation_drawer/doan_chat.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeigt = MediaQuery.of(context).size.height;
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 25),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const ChuyenTaiKhoan()));
                  },
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage('https://i.imgur.com/sinZa9i.jpeg'),
                  ),
                  title: const Text('Phúc Hoàng  ▼', style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const Me()));
                    },
                      child: const Icon(Icons.settings)),
                ),
              ),

              ListTile(
                onTap: (){
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context)
                    //     => const DoanChat()));
                },
                title: const Text('Đoạn chat'),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10
                  ),
                    child: const Icon(Icons.chat_bubble_outlined, color: Colors.black,)),
              ),

              ListTile(
                onTap: (){

                },
                title: const Text('Marketplace'),
                leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10
                    ),
                    child: const Icon(Icons.storefront_rounded, color: Colors.black,)),
              ),
              ListTile(
                onTap: (){

                },
                title: const Text('Tin nhắn đang chờ'),
                leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10
                    ),
                    child: const Icon(Icons.mark_unread_chat_alt_rounded, color: Colors.black,)),
              ),
              ListTile(
                onTap: (){

                },
                title: const Text('Kho lưu trữ'),
                leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10
                    ),
                    child: const Icon(Icons.save, color: Colors.black,)),
              ),

            ],
          ),
        ),
    );
  }
}
