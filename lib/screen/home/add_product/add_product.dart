import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:second_layout/bloc/phone_bloc/phone_bloc.dart';
import 'package:second_layout/bloc/phone_bloc/phone_event.dart';
import 'package:second_layout/bloc/phone_bloc/phone_state.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}


class _AddProductState extends State<AddProduct> {

  bool checkInfo(){
    if (urlController.text.isEmpty 
        || phone_nameController.text.isEmpty
        || sale_priceController.text.isEmpty
        || soldController.text.isEmpty
        || descriptionController.text.isEmpty
    || brand == false){
      return false;
    }
    return true;
  }

  final urlController = TextEditingController();
  final phone_nameController = TextEditingController();
  final original_priceController = TextEditingController();
  final sale_priceController = TextEditingController();
  final soldController = TextEditingController();
  final descriptionController = TextEditingController();
  final typeController = TextEditingController();
  int _type = 1;
  String brand ="";
  bool checkAdd = false;

  @override
  void dispose() {
    // Dispose the TextEditingController when the widget is removed from the tree
    urlController.dispose();
    phone_nameController.dispose();
    original_priceController.dispose();
    typeController.dispose();
    sale_priceController.dispose();
    soldController.dispose();
    descriptionController.dispose();
    super.dispose();
  }



  var formatter = NumberFormat.decimalPattern('vi_VN');
  @override
  Widget build(BuildContext context) {

    // FocusManager.instance.primaryFocus?.unfocus();

    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeigh = MediaQuery.of(context).size.height;

    return BlocBuilder<PhoneBloc,PhoneState>(
        builder: (context, state)
        {
            return Scaffold(
              // resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('Thêm sản phẩm', style: TextStyle(color: Colors.black),),
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              body: Container(
                height: maxHeigh,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.white,
                      Colors.lightBlueAccent,
                      Colors.cyan])),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text('Nhập thông tin sản phẩm cần thêm mới', style:
                          TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                              fontSize: 18),),
                        ),
                        SizedBox(
                          height: maxHeigh*0.02,
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            width: maxWidth,
                            child: SingleChildScrollView(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Radio(
                                        value: 1,
                                        groupValue: _type,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _type = 1;
                                            brand = "Iphone";
                                          });
                                        }),
                                  ),
                                  const Text('Iphone'),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Radio(
                                        value: 2,
                                        groupValue: _type,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _type = 2;
                                            brand = "Realme";
                                          });
                                        }),
                                  ),
                                  const Text('Realme'),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Radio(
                                        value: 3,
                                        groupValue: _type,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _type = 3;
                                            brand = "Xiaomi";
                                          });
                                        }),
                                  ),
                                  const Text('Xiaomi'),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Radio(
                                        value: 4,
                                        groupValue: _type,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _type = 4;
                                            brand = "Oppo";
                                          });
                                        }),
                                  ),
                                  const Text('Oppo'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: maxHeigh*0.02,
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            width: maxWidth,
                            height: maxHeigh*0.1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: phone_nameController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Nhập tên sản phẩm',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: maxHeigh*0.02,
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            width: maxWidth,
                            height: maxHeigh*0.1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: urlController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Nhập url hình ảnh sản phẩm',
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: maxHeigh*0.02,
                        // ),
                        // SizedBox(
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20),
                        //         color: Colors.white
                        //     ),
                        //     width: maxWidth*0.8,
                        //     height: maxHeigh*0.1,
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        //       child: TextFormField(
                        //         controller: original_priceController,
                        //         decoration: const InputDecoration(
                        //           border: UnderlineInputBorder(),
                        //           labelText: 'Nhập giá gốc sản phẩm',
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: maxHeigh*0.02,
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            width: maxWidth,
                            height: maxHeigh*0.1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: sale_priceController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Nhập giá bán sản phẩm',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: maxHeigh*0.02,
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            width: maxWidth,
                            height: maxHeigh*0.1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: soldController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Nhập số lượng đã bán sản phẩm',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: maxHeigh*0.02,
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            width: maxWidth,
                            height: maxHeigh*0.1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: descriptionController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Nhập giới thiệu sản phẩm',
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: maxWidth*0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    if (checkAdd)
                                      {
                                        context.read<PhoneBloc>().add(AddPhoneItemEvent(
                                          url: urlController.text,
                                          phone_name: phone_nameController.text,
                                          original_price: original_priceController.text,
                                          sale_price: sale_priceController.text,
                                          sold: soldController.text,
                                          description: descriptionController.text,
                                          type: _type,

                                        ));
                                        Fluttertoast.showToast(
                                            msg: "Đã thêm sản phẩm loại: ${brand} thành công! 😎",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                        Navigator.pop(context);
                                      }
                                    else
                                      {
                                        Fluttertoast.showToast(
                                            msg: "Phải review sản phẩm trước khi thêm! 🤬",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                      }
                                  },
                                  child: const Text('Thêm',style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: maxHeigh*0.05),
                                width: maxWidth*0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                ),
                                child: TextButton(
                                  onPressed: (){
                                     if (checkInfo() == true)
                                       {
                                         setState(() {
                                           checkAdd = true;
                                         });
                                         showDialog(
                                             context: context,
                                             builder: (context) => AlertDialog(
                                               title: const Align(
                                                   alignment: Alignment.center,
                                                   child: Text('Preview sản phẩm',style: TextStyle(
                                                       fontWeight: FontWeight.bold
                                                   ),)),
                                               content:
                                               Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   Image.network(urlController.text),
                                                   const SizedBox(
                                                     height: 15,
                                                   ),
                                                   Row(
                                                     children: [
                                                       const Text('- Tên sản phẩm: ',
                                                         style: TextStyle(fontSize: 15),),
                                                       Text(phone_nameController.text,
                                                         style: const TextStyle(fontWeight: FontWeight.bold
                                                             ,fontSize: 20),),
                                                     ],
                                                   ),
                                                   const SizedBox(
                                                     height: 15,
                                                   ),
                                                   Row(
                                                     children: [
                                                       const Text('- Hãng sản phẩm: ',
                                                         style: TextStyle(fontSize: 15),),
                                                       Text(brand,
                                                         style: const TextStyle(fontWeight: FontWeight.bold
                                                             ,fontSize: 15),),
                                                     ],
                                                   ),
                                                   const SizedBox(
                                                     height: 15,
                                                   ),
                                                   // Row(
                                                   //   children: [
                                                   //     const Text('- Giá gốc:',
                                                   //       style: TextStyle(fontSize: 20),),
                                                   //     Padding(
                                                   //       padding:
                                                   //       const EdgeInsets.only(
                                                   //           left: 10),
                                                   //       child: Text(
                                                   //           formatter.format(int
                                                   //               .parse(original_priceController.text)),
                                                   //           style: const TextStyle(
                                                   //               decoration: TextDecoration.lineThrough,
                                                   //               fontSize: 20,
                                                   //               fontWeight:
                                                   //               FontWeight
                                                   //                   .bold)),
                                                   //     ),
                                                   //     const Text('đ',
                                                   //         style: TextStyle(
                                                   //             fontSize: 20,
                                                   //             fontWeight:
                                                   //             FontWeight.bold))
                                                   //   ],
                                                   // ),
                                                   Row(
                                                     children: [
                                                       const Text('- Giá bán:',
                                                         style: TextStyle(fontSize: 15),),
                                                       Padding(
                                                         padding:
                                                         const EdgeInsets.only(
                                                             left: 10),
                                                         child: Text(
                                                             formatter.format(int
                                                                 .parse(sale_priceController.text)),
                                                             style: const TextStyle(
                                                                 fontSize: 15,
                                                                 fontWeight:
                                                                 FontWeight
                                                                     .bold)),
                                                       ),
                                                       const Text('đ',
                                                           style: TextStyle(
                                                               fontSize: 15,
                                                               fontWeight:
                                                               FontWeight.bold))
                                                     ],
                                                   ),
                                                   const SizedBox(
                                                     height: 15,
                                                   ),

                                                   Row(
                                                     children: [
                                                       const Text('- Mô tả:',
                                                         style: TextStyle(fontSize: 15),),
                                                       Padding(
                                                         padding:
                                                         const EdgeInsets.only(
                                                             left: 10),
                                                         child: Text(
                                                             descriptionController.text,
                                                             style: const TextStyle(
                                                                 fontSize: 15,
                                                                 fontWeight:
                                                                 FontWeight
                                                                     .bold)),
                                                       ),
                                                     ],
                                                   ),
                                                   SizedBox(
                                                     height: maxHeigh*0.2,
                                                   ),
                                                   Align(
                                                     alignment: Alignment.center,
                                                     child: Container(
                                                       width: 100,
                                                       decoration: BoxDecoration(
                                                           borderRadius: BorderRadius.circular(20),
                                                           color: Colors.blue
                                                       ),
                                                       child: TextButton(
                                                         onPressed: (){
                                                           Navigator.pop(context);
                                                         },
                                                         child: const Text('Thoát',style: TextStyle(color: Colors.white),),
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ));
                                       }
                                     else
                                       {
                                         Fluttertoast.showToast(
                                             msg: "Chưa nhập đủ thông tin!",
                                             toastLength: Toast.LENGTH_SHORT,
                                             gravity: ToastGravity.BOTTOM,
                                             timeInSecForIosWeb: 1,
                                             textColor: Colors.white,
                                             fontSize: 16.0
                                         );
                                       }
                                  },
                                  child: const Text('Preview',style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
        }
    );
  }
}
