import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:second_layout/bloc/cart_bloc/cart_bloc_2.dart';
import 'package:second_layout/bloc/cart_bloc/cart_event_2.dart';
import 'package:second_layout/bloc/cart_bloc/cart_state_2.dart';
import 'package:second_layout/screen/home/model/cart_item_list.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}


class _CartDetailState extends State<CartDetail> {
  int tongtien = 0;
  int tongtien2 = 0;
  var formatter = NumberFormat.decimalPattern('vi_VN');
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CartItemBloc2, CartState2>(
      builder: (context,state)
      {
        bool visible = itemCartList.isNotEmpty;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Giỏ hàng: ${itemCartList.length.toString()}',
            style: const TextStyle(color: Colors.black),),
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body:  Column(
            children: [
              Visibility(
                visible: !visible,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Image.network('https://assets.materialup.com/uploads/16e7d0ed-140b-4f86-9b7e-d9d1c04edb2b/preview.png'),
                      const Text('Giỏ hàng của bạn đang trống 🫠',
                        style: TextStyle(fontSize: 20),),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Hãy mua gì đó và quay lại nhe! 😎',
                        style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: visible,
                child: Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: itemCartList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: Image.network(itemCartList[index].url),
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: maxWidth*0.4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(itemCartList[index].phone_name,
                                            style: TextStyle(fontSize: 15),),
                                            Text('${formatter.format(int.parse(itemCartList[index].sale_price))} đ',
                                                style: TextStyle(fontSize: 15)),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                              context.read<CartItemBloc2>().add(MinusQuantity(
                                                  url: itemCartList[index].url,
                                                  phone_name: itemCartList[index].phone_name,
                                                  original_price: itemCartList[index].original_price,
                                                  sale_price: itemCartList[index].sale_price,
                                                  sold: itemCartList[index].sold,
                                                  description: itemCartList[index].description,
                                                  soluong: itemCartList[index].soluong,
                                              tongtien: 0));
                                          });
                                        },
                                          child: const Icon(Icons.arrow_back_ios_new)),
                                      Text(" "),
                                      Text('${itemCartList[index].soluong}',
                                      style: const TextStyle(fontSize: 18),),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            context.read<CartItemBloc2>().add(AddCartItemEvent(
                                              url: itemCartList[index].url,
                                              phone_name: itemCartList[index].phone_name,
                                              original_price: itemCartList[index].original_price,
                                              sale_price: itemCartList[index].sale_price,
                                              sold: itemCartList[index].sold,
                                              description: itemCartList[index].description,
                                              soluong: itemCartList[index].soluong,
                                              tongtien: 0,
                                              badge_count: 0,
                                            ));
                                          });
                                        },
                                          child: const Icon(Icons.arrow_forward_ios)),
                                      Text(" "),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: InkWell(
                                onTap: (){
                                  setState(() {
                                    context.read<CartItemBloc2>().add(DeleteCartItemEvent(
                                        url: itemCartList[index].url,
                                        phone_name: itemCartList[index].phone_name,
                                        original_price: itemCartList[index].original_price,
                                        sale_price: itemCartList[index].sale_price,
                                        sold: itemCartList[index].sold,
                                        description: itemCartList[index].description,
                                        soluong: itemCartList[index].soluong,
                                        badge_count: itemCartList.length - 1,
                                        tongtien: 0,
                                    ));

                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // Define a variable to track whether the sheet should be closed
                                        bool shouldCloseSheet = false;
                                        // Schedule the sheet to be closed after 1 second
                                        Future.delayed(const Duration(seconds: 1), () {
                                          shouldCloseSheet = true;
                                          Navigator.of(context).pop(); // Close the sheet
                                        });
                                        return StatefulBuilder(
                                          builder: (BuildContext context, StateSetter setState) {
                                            return GestureDetector(
                                              onTap: () {
                                                // If the user taps on the sheet, cancel the scheduled closure
                                                setState(() {
                                                  shouldCloseSheet = false;
                                                });
                                              },
                                              child: AnimatedContainer(
                                                // Use AnimatedContainer to animate the sheet's appearance if needed
                                                duration: const Duration(seconds: 1),
                                                height: shouldCloseSheet ? 0 : 50, // Hide the sheet if shouldCloseSheet is true
                                                color: Colors.blue,
                                                child: const Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text('Đã xoá sản phẩm! 😢',
                                                      style: TextStyle(color: Colors.white,
                                                          fontSize: 20),),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );


                                  });
                                },
                                  child: const Icon(Icons.delete, color: Colors.red,)),
                            ),
                          );
                      }
                      ),
                  ),
                ),
              ),
              Visibility(
                visible: visible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Tổng tiền: ',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black, // Màu chữ mặc định
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${formatter.format(state.tongtien)} đ',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold// Màu chữ đỏ
                              ),
                            ),
                          ],
                        ),
                      ),

                      TextButton(
                          onPressed: (){
                            setState(() {
                              itemCartList.clear();
                              context.read<CartItemBloc2>().add(BadgeCountAfterPay(
                                badge_count: 0,
                              ));
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  // Define a variable to track whether the sheet should be closed
                                  bool shouldCloseSheet = false;
                                  // Schedule the sheet to be closed after 1 second
                                  Future.delayed(const Duration(seconds: 1), () {
                                    shouldCloseSheet = true;
                                    Navigator.of(context).pop(); // Close the sheet
                                  });
                                  return StatefulBuilder(
                                    builder: (BuildContext context, StateSetter setState) {
                                      return GestureDetector(
                                        onTap: () {
                                          // If the user taps on the sheet, cancel the scheduled closure
                                          setState(() {
                                            shouldCloseSheet = false;

                                          });
                                        },
                                        child: AnimatedContainer(
                                          // Use AnimatedContainer to animate the sheet's appearance if needed
                                          duration: const Duration(seconds: 1),
                                          height: shouldCloseSheet ? 0 : 50, // Hide the sheet if shouldCloseSheet is true
                                          color: Colors.blue,
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Cám ơn bạn đã mua hàng 😍',
                                                style: TextStyle(color: Colors.white,
                                                    fontSize: 20),),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );

                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue
                              ),
                              height: 50,
                              width: 150,
                              child: const Center(
                                  child: Text('Thanh toán',
                                    style: TextStyle(color: Colors.white,
                                    fontSize: 20),)),
                            ),
                          )),

                    ],
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
