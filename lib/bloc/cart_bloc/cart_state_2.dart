import 'package:equatable/equatable.dart';

class CartState2 extends Equatable {
  final String url;
  final String phone_name;
  final String original_price;
  final String sale_price;
  final String sold;
  final String description;
  final int soluong;
  int tongtien;
  int badge_count;

   CartState2({
    this.url = "",
    this.phone_name ="",
    this.original_price = "",
    this.sale_price = "",
    this.sold = "",
    this.description = "",
    this.soluong = 0,
    this.tongtien = 0,
     this.badge_count = 0,
  });

  CartState2 update({
    String? url,
    String? phone_name,
    String? original_price,
    String? sale_price,
    String? sold,
    String? description,
    int? soluong,
    int? tongtien,
    int? badge_count,
  })

  {
    return CartState2(
      url: url ?? this.url,
      phone_name: phone_name ?? this.phone_name,
      original_price: original_price ?? this.original_price,
      sale_price: sale_price ?? this.sale_price,
      sold: sold ?? this.sold,
      description: description ?? this.description,
      soluong: soluong ?? this.soluong,
      tongtien: tongtien ?? this.tongtien,
        badge_count: badge_count ?? this.badge_count,
    );
  }

  @override
  List<Object> get props => [
    url,phone_name, original_price, sale_price, sold, description, soluong, tongtien,
    badge_count
  ];
}