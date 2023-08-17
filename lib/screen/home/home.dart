import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:second_layout/screen/home/add_product/add_product.dart';

import 'package:second_layout/screen/home/all_products/all_products.dart';
import 'package:second_layout/screen/home/iphone/iphone.dart';
import 'package:second_layout/screen/home/oppo/oppo.dart';
import 'package:second_layout/screen/home/realme/realme.dart';
import 'package:second_layout/screen/home/xiaomi/xiaomi.dart';
import 'package:second_layout/screen/login/login.dart';
import 'package:second_layout/screen/me/me.dart';
import 'package:second_layout/screen/navigation_drawer/navigation_bar_drawer.dart';
import 'package:second_layout/screen/test/test.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List pages = [
    const Iphone(),
    const Realme(),
    const Oppo(),
    const Xiaomi(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      body: Stack(
        children: [
          pages[currentIndex],
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: SpeedDial(
              spaceBetweenChildren: 10,
              overlayOpacity: 0.8,
              animatedIcon: AnimatedIcons.menu_close,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.person_outlined),
                  label: 'Profile',
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => const Me()));
                  }
                ),
                SpeedDialChild(
                    child: const Icon(Icons.border_all_outlined),
                    label: 'All Products',
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:
                          (context) => const AllProducts()));
                    }
                ),
                SpeedDialChild(
                    child: const Icon(Icons.border_all_outlined),
                    label: 'Add phone',
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:
                          (context) => const AddProduct()));
                    }
                ),
                SpeedDialChild(
                  child: const Icon(Icons.logout_outlined),
                  label: 'Logout',
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
                          (context) => const Login()));
                    }
                ),
                SpeedDialChild(
                    child: const Icon(Icons.animation),
                    label: 'Test',
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:
                          (context) => const Test()));
                    }
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        selectedFontSize: 18,
        unselectedFontSize: 10,


        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_iphone.png'),
            label: 'Iphone',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_realme.png'),
            label: 'Realme',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_oppo.png'),
            label: 'Oppo',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_xiaomi.jpg'),
            label: 'Xiaomi',
          ),
        ],
      ),


    );
  }
}
