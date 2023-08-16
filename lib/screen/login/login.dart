import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:second_layout/main.dart';
import 'package:second_layout/screen/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;
  final tendangnhapController = TextEditingController();
  final matkhauController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool areFieldsValid = false;

  @override
  void initState() {
    super.initState();
    tendangnhapController.addListener(validateFields);
    matkhauController.addListener(validateFields);
  }

  void validateFields() {
    final isTendangnhapValid = tendangnhapController.text.isNotEmpty;
    final isMatkhauValid = matkhauController.text.isNotEmpty;
    setState(() {
      areFieldsValid = isTendangnhapValid && isMatkhauValid;
    });
  }

  @override
  void dispose() {
    tendangnhapController.dispose();
    matkhauController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight= MediaQuery.of(context).size.height;

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://static.xx.fbcdn.net/rsrc.php/v3/y2/r/yvbOx5two0W.png'),
              
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: maxWidth*0.8,
                child: TextFormField(
                  validator: (value) {
                    if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                        .hasMatch(value!)) {
                      return "Hãy nhập đúng số điện thoại";
                    }
                    else {
                      return null;
                    }
                  },
                  controller: tendangnhapController,
                  decoration: const InputDecoration(
                    labelText: 'Số điện thoại',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: maxWidth*0.8,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  controller: matkhauController,
                  obscureText: !_isPasswordVisible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Hãy nhập mật khẩu";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: maxWidth*0.8,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: areFieldsValid
                      ? () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );

                          }
                          tendangnhapController.clear();
                          matkhauController.clear();
                          
                        }
                      : null,
                  child: const Text('Đăng nhập'),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Quên mật khẩu',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
