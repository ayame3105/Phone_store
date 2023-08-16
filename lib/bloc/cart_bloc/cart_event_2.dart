

import 'package:flutter/material.dart';

@immutable
abstract class AddCartEvent {}

class AddCartItemEvent extends AddCartEvent {
  final String url;
  final String phone_name;
  final String original_price;
  final String sale_price;
  final String sold;
  final String description;
  int soluong;
  int tongtien;
  int badge_count;

  AddCartItemEvent({
    required this.url,
    required this.phone_name,
    required this.original_price,
    required this.sale_price,
    required this.sold,
    required this.description,
    required this.soluong,
    required this.tongtien,
    required this.badge_count
  });

}

class DeleteCartItemEvent extends AddCartEvent {
  final String url;
  final String phone_name;
  final String original_price;
  final String sale_price;
  final String sold;
  final String description;
  final int soluong;
  int tongtien;
  int badge_count;

  DeleteCartItemEvent({
    required this.url,
    required this.phone_name,
    required this.original_price,
    required this.sale_price,
    required this.sold,
    required this.description,
    required this.soluong,
    required this.badge_count,
    required this.tongtien,
  });
}


class BadgeCountAfterPay extends AddCartEvent {
  int badge_count;

  BadgeCountAfterPay({
    required this.badge_count,
  });
}


class MinusQuantity extends AddCartEvent {
  final String url;
  final String phone_name;
  final String original_price;
  final String sale_price;
  final String sold;
  final String description;
  int soluong;
  int tongtien;

  MinusQuantity({
    required this.url,
    required this.phone_name,
    required this.original_price,
    required this.sale_price,
    required this.sold,
    required this.description,
    required this.soluong,
    required this.tongtien,
  });
}
