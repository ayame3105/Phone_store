import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_layout/bloc/theme_bloc/themes_bloc.dart';

enum Mode { Off, On, System }
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Mode? _modePick = Mode.Off;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        final maxWidth = MediaQuery.of(context).size.width;
        final themeBloc = BlocProvider.of<ThemesBloc>(context);
        _modePick = _getModePick(state.themeMode);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: const Text('Chế độ tối', style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.black),),
          ),
          body: Column(
            children: [
              // TextButton(
              //     onPressed: () => themeBloc.add(ToggleThemeEvent()),
              //     child: Text('Change Theme')),
              RadioListTile<Mode>(
                title: const Text('Tắt'),
                value: Mode.Off,
                groupValue: _modePick,
                onChanged: (Mode? value) {
                  setState(() {
                    _modePick = value!;
                    themeBloc.add(ToggleThemeEvent());
                  });
                },
              ),
              RadioListTile<Mode>(
                title: const Text('Bật'),
                value: Mode.On,
                groupValue: _modePick,
                onChanged: (Mode? value) {
                  setState(() {
                    _modePick = value!;
                    themeBloc.add(ToggleThemeEvent());
                  });
                },
              ),
              RadioListTile<Mode>(
                title: const Text('Hệ thống'),
                value: Mode.System,
                groupValue: _modePick,
                onChanged: (Mode? value) {
                  setState(() {
                    _modePick = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: maxWidth*0.07),
                child: Text('Nếu bạn chọn hệ thống, Messenger sẽ tự động điều chỉnh giao diện theo các cài đặt hệ thống trên thiết bị',
                style: TextStyle(color: Colors.grey),),
              )

            ],
          ),
        );
      },
    );
  }


  Mode _getModePick(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return Mode.Off;
      case ThemeMode.dark:
        return Mode.On;
      default:
        return Mode.System;
    }
  }

}

