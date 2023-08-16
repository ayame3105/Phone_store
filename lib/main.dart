import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_layout/bloc/cart_bloc/cart_bloc_2.dart';
import 'package:second_layout/bloc/phone_bloc/phone_bloc.dart';
import 'package:second_layout/bloc/theme_bloc/themes_bloc.dart';
import 'package:second_layout/screen/home/home.dart';
import 'package:second_layout/screen/login/login.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemesBloc>(
          create: (BuildContext context) => ThemesBloc()..add(InitialThemeEvent()),
        ),
        BlocProvider<PhoneBloc>(
          create: (BuildContext context) => PhoneBloc(),
        ),
        BlocProvider<CartItemBloc2>(
            create: (BuildContext context) => CartItemBloc2())
      ],
      child: BlocBuilder<ThemesBloc, ThemesState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            home: Login(),
          );
        },
      ),
    );
  }
}
