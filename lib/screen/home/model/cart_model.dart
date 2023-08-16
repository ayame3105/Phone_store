class Cart {
  late final int? id;
  final String url;
  final String phone_name;
  final String original_price;
  final String sale_price;
  final String sold;
  final String description;
  Cart({
    required this.id,
    required this.url,
    required this.phone_name,
    required this.original_price,
    required this.sale_price,
    required this.sold,
    required this.description,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
  :id  = res ['id'],
        url  = res ["url"],
        phone_name  = res ["phone_name"],
        original_price  = res ["original_price"],
        sale_price  = res ["sale_price"],
        sold  = res ["sold"],
        description  = res ["description"];
  Map<String, Object?> toMap(){
    return{
      'id': id,
      'url': url,
      'phone_name': phone_name,
      'original_price': original_price,
      'sale_price': sale_price,
      'sold': sold,
      'description': description,
    };
  }


}