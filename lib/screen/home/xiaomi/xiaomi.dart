import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:second_layout/bloc/cart_bloc/cart_bloc_2.dart';
import 'package:second_layout/bloc/cart_bloc/cart_event_2.dart';
import 'package:second_layout/bloc/cart_bloc/cart_state_2.dart';
import 'package:second_layout/screen/home/model/cart.dart';
import 'package:second_layout/screen/home/model/cart_item_list.dart';
import 'package:second_layout/screen/home/xiaomi/xiaomi_item.dart';
import 'package:second_layout/screen/navigation_drawer/navigation_bar_drawer.dart';
import 'package:badges/badges.dart' as badges;
import 'package:transparent_image/transparent_image.dart';

class Xiaomi extends StatefulWidget {
  const Xiaomi({super.key});

  @override
  State<Xiaomi> createState() => _XiaomiState();
}

class _XiaomiState extends State<Xiaomi> {
  int soluong = 0;
  int tongtien = 0;
  var formatter = NumberFormat.decimalPattern('vi_VN');


  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        actions: [
          InkWell(onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartDetail()));
          }, child: BlocBuilder<CartItemBloc2, CartState2>(
            builder: (context, state) {
              return Center(
                child: badges.Badge(
                  badgeContent: Text(
                    '${state.badge_count}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: const Icon(
                    Icons.shop,
                    color: Colors.white,
                  ),
                ),
              );
            },
          )),
          const SizedBox(
            width: 20,
          )
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Số lượng Xiaomi: ${itemXiaomi.length.toString()}',
          style:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body:  Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.lightBlueAccent,
                  Colors.cyan
                ])),
        child: BlocBuilder<CartItemBloc2, CartState2>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 10),
              child: Scrollbar(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: maxWidth / maxHeight / 0.98,
                    crossAxisCount:
                    2, // Số cột trong grid (1 dòng có 2 item)
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 3,
                  ),
                  itemCount: itemXiaomi.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Flexible(
                          child: InkWell(
                            onLongPress: (){
                              setState(() {
                                itemXiaomi.removeAt(index);
                                Fluttertoast.showToast(
                                    msg: "Đã xoá sản phẩm! 🤬",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              });
                            },
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 130,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Text(
                                            'Bạn có muốn thêm sản phẩm?',
                                            style: TextStyle(fontSize: 20),),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                itemXiaomi[index]
                                                    .phone_name,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                    formatter.format(int
                                                        .parse(itemXiaomi[
                                                    index]
                                                        .sale_price)),
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                              ),
                                              const Text('đ',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                child: const Text('Thêm'),
                                                onPressed: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    bool isSnackBarVisible = true;
                                                    if (isSnackBarVisible) {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: GestureDetector(
                                                            onTap: () {
                                                              // Do something when the SnackBar is tapped
                                                            },
                                                            child: AnimatedContainer(
                                                              duration: const Duration(milliseconds: 500),
                                                              height: 50,
                                                              width: maxWidth,
                                                              child: const Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    'Đã thêm 1 sản phẩm vào giỏ 😘',
                                                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          duration: const Duration(seconds: 1), // Thời gian hiển thị SnackBar
                                                        ),
                                                      );
                                                      isSnackBarVisible = false; // Đặt biến kiểm soát thành false sau khi hiển thị SnackBar
                                                    }

                                                    soluong = soluong + 1;
                                                    context.read<CartItemBloc2>().add(AddCartItemEvent(
                                                        url: itemXiaomi[
                                                        index]
                                                            .url,
                                                        phone_name:
                                                        itemXiaomi[
                                                        index]
                                                            .phone_name,
                                                        original_price:
                                                        itemXiaomi[
                                                        index]
                                                            .original_price,
                                                        sale_price:
                                                        itemXiaomi[
                                                        index]
                                                            .sale_price,
                                                        sold: itemXiaomi[
                                                        index]
                                                            .sold,
                                                        description:
                                                        itemXiaomi[
                                                        index]
                                                            .description,
                                                        soluong: soluong,
                                                        tongtien: tongtien,
                                                        badge_count:
                                                        itemCartList
                                                            .length));

                                                    soluong = 0;
                                                    tongtien = 0;
                                                  });
                                                },
                                              ),
                                              ElevatedButton(
                                                child: const Text('Huỷ'),
                                                onPressed: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: maxWidth * 0.6,
                              height: maxHeight * 0.55,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: maxHeight * 0.35,
                                      width: maxWidth * 0.5,
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: itemXiaomi[index].url,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${formatter.format(int.parse(itemXiaomi[index].sale_price))} đ',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          '${formatter.format(int.parse(itemXiaomi[index].sale_price))} đ',
                                          style: const TextStyle(
                                              decoration: TextDecoration
                                                  .lineThrough,
                                              color: Colors.red,
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 13,
                                        ),
                                        Text(itemXiaomi[index].phone_name,
                                            style: const TextStyle(fontSize: 12)),
                                        const Icon(
                                          Icons.add_shopping_cart,
                                          size: 13,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
