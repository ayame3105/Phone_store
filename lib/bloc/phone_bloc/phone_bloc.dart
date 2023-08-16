

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_layout/bloc/phone_bloc/phone_event.dart';
import 'package:second_layout/bloc/phone_bloc/phone_state.dart';
import 'package:second_layout/screen/home/iphone/iphone_item.dart';
import 'package:second_layout/screen/home/model/phone_class.dart';
import 'package:second_layout/screen/home/oppo/oppo_item.dart';
import 'package:second_layout/screen/home/realme/realme_item.dart';
import 'package:second_layout/screen/home/xiaomi/xiaomi_item.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {


  PhoneBloc() : super(
    const PhoneState(
      url: "",
      phone_name: "",
      original_price: "",
      sale_price: "",
      sold: "",
      description: "",
      type: 1,
    ),

  ) {
    on<AddPhoneItemEvent>(onAddPhone);
  }

  onAddPhone(AddPhoneItemEvent event, Emitter<PhoneState> emit) {

    if (event.type == 1){
      final newIphone = PhoneClass(
        url: event.url,
        phone_name: event.phone_name,
        original_price: event.original_price,
        sale_price: event.sale_price,
        sold: event.sold,
        description: event.description,
      );
      itemIphone.add(newIphone);
    }
    if (event.type == 2){
      final newRealme = PhoneClass(
        url: event.url,
        phone_name: event.phone_name,
        original_price: event.original_price,
        sale_price: event.sale_price,
        sold: event.sold,
        description: event.description,
      );
      itemRealme.add(newRealme);
    }
    if (event.type == 3){
      final newOppo = PhoneClass(
        url: event.url,
        phone_name: event.phone_name,
        original_price: event.original_price,
        sale_price: event.sale_price,
        sold: event.sold,
        description: event.description,
      );
      itemOppo.add(newOppo);
    }
    if (event.type == 4){
      final newXiaomi = PhoneClass(
        url: event.url,
        phone_name: event.phone_name,
        original_price: event.original_price,
        sale_price: event.sale_price,
        sold: event.sold,
        description: event.description,
      );
      itemXiaomi.add(newXiaomi);
    }




    emit(state.update(
      url: event.url,
      phone_name: event.phone_name,
      original_price: event.original_price,
      sale_price: event.sale_price,
      sold: event.sold,
      description: event.description,
      type: event.type,
    ));
  }

}