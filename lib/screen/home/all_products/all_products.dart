import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_layout/screen/home/iphone/iphone_item.dart';
import 'package:second_layout/screen/home/oppo/oppo_item.dart';
import 'package:second_layout/screen/home/realme/realme_item.dart';
import 'package:second_layout/screen/home/xiaomi/xiaomi_item.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  var formatter = NumberFormat.decimalPattern('vi_VN');
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    int count_all = itemIphone.length+itemXiaomi.length+itemOppo.length+itemRealme.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toàn bộ sản phẩm', style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white,
              Colors.lightBlueAccent,
              Colors.cyan])),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Tổng lượng sản phẩm trong kho: ${count_all}'),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                    child: Text('Tất cả sản phẩm Iphone: ${itemIphone.length}')),
                const SizedBox(height: 20,),
                SizedBox(
                  height: maxHeight*0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemIphone.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: maxWidth * 0.5,
                        height: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: maxHeight * 0.2,
                                  width: maxWidth * 0.3,
                                  child: Image.network(
                                      itemIphone[index].url)),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${formatter.format(int.parse(itemIphone[index].sale_price))} đ',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    '${formatter.format(int.parse(itemIphone[index].sale_price))} đ',
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
                                  Text(itemIphone[index].phone_name,
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
                      );
                    }
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('Tất cả sản phẩm Realme: ${itemRealme.length}')),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: maxHeight*0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemRealme.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: maxWidth * 0.5,
                          height: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: maxHeight * 0.2,
                                    width: maxWidth * 0.3,
                                    child: Image.network(
                                        itemRealme[index].url)),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${formatter.format(int.parse(itemRealme[index].sale_price))} đ',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      '${formatter.format(int.parse(itemRealme[index].sale_price))} đ',
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
                                    Text(itemRealme[index].phone_name,
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
                        );
                      }
                  ),
                ),
               //--------------------------
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('Tất cả sản phẩm Oppo: ${itemOppo.length}')),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: maxHeight*0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemOppo.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: maxWidth * 0.5,
                          height: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: maxHeight * 0.2,
                                    width: maxWidth * 0.3,
                                    child: Image.network(
                                        itemOppo[index].url)),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${formatter.format(int.parse(itemOppo[index].sale_price))} đ',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      '${formatter.format(int.parse(itemOppo[index].sale_price))} đ',
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
                                    Text(itemOppo[index].phone_name,
                                        style: const TextStyle(fontSize: 12)),
                                    const Icon(
                                      Icons.add_shopping_cart,
                                      size: 13,
                                    ),
                                  ],
                                ),
                                //------------------------------------
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child:  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('Tất cả sản phẩm Xiaomi: ${itemXiaomi.length}')),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: maxHeight*0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemXiaomi.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: maxWidth * 0.5,
                          height: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: maxHeight * 0.2,
                                    width: maxWidth * 0.3,
                                    child: Image.network(
                                        itemXiaomi[index].url)),
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
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
