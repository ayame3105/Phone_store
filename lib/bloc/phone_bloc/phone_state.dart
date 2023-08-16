import 'package:equatable/equatable.dart';

class PhoneState extends Equatable {
  final String url;
  final String phone_name;
  final String original_price;
  final String sale_price;
  final String sold;
  final String description;
  final int type;

  const PhoneState({
    this.url = "",
    this.phone_name ="",
    this.original_price = "",
    this.sale_price = "",
    this.sold = "",
    this.description = "",
    this.type= 1,
  });

  PhoneState update({
    String? url,
    String? phone_name,
    String? original_price,
    String? sale_price,
    String? sold,
    String? description,
    int? type,
  })

  {
    return PhoneState(
      url: url ?? this.url,
      phone_name: phone_name ?? this.phone_name,
      original_price: original_price ?? this.original_price,
      sale_price: sale_price ?? this.sale_price,
      sold: sold ?? this.sold,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [
    url,phone_name, original_price, sale_price, sold, description, type
  ];
}