

import 'package:bloc/bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:second_layout/bloc/cart_bloc/cart_event_2.dart';
import 'package:second_layout/bloc/cart_bloc/cart_state_2.dart';
import 'package:second_layout/screen/home/model/cart_item_list.dart';
import 'package:second_layout/screen/home/model/cart_mode_2.dart';


class CartItemBloc2 extends Bloc<AddCartEvent, CartState2> {


  CartItemBloc2() : super(
     CartState2(
        url: "",
        phone_name: "",
        original_price: "",
        sale_price: "",
        sold: "",
        description: "",
        soluong: 0,
        tongtien: 0,
        badge_count: 0,
    ),

  )
  {
    on<AddCartItemEvent>(onAddCartItem);
    on<DeleteCartItemEvent>(onDeleteLead);
    on<BadgeCountAfterPay>(onBadgeCountAfterPay);
    on<MinusQuantity>(onMinusQuantity);
  }

  onAddCartItem(AddCartItemEvent event, Emitter<CartState2> emit) {
    bool isExistingItem = false;

    for (int i = 0; i < itemCartList.length; i++) {
      if (itemCartList[i].phone_name == event.phone_name &&
          itemCartList[i].original_price == event.original_price &&
          itemCartList[i].url == event.url &&
          itemCartList[i].sale_price == event.sale_price &&
          itemCartList[i].sold == event.sold &&
          itemCartList[i].description == event.description)
      {
        final updatedItem = CartClass(
          url: itemCartList[i].url,
          phone_name: itemCartList[i].phone_name,
          original_price: itemCartList[i].original_price,
          sale_price: itemCartList[i].sale_price,
          sold: itemCartList[i].sold,
          description: itemCartList[i].description,
          soluong: itemCartList[i].soluong + 1,
        );
        if (updatedItem.soluong > 9)
          {
            Fluttertoast.showToast(
              msg: 'Tối đa 9 sản phẩm! 🤬',
              toastLength: Toast.LENGTH_SHORT,
            );
            isExistingItem = true;
            break;
          }
       else
         {
           itemCartList[i] = updatedItem;
           isExistingItem = true;
           event.badge_count = itemCartList.length;
           break;
         }
      }
    }

    if (!isExistingItem) {
      final newItemCart = CartClass(
        url: event.url,
        phone_name: event.phone_name,
        original_price: event.original_price,
        sale_price: event.sale_price,
        sold: event.sold,
        description: event.description,
        soluong: event.soluong,
      );
      if(newItemCart.soluong == 9)
        {
            return;
        }
      else
        {
          itemCartList.add(newItemCart);
          event.badge_count = itemCartList.length;
        }
    }

    for (int i = 0; i < itemCartList.length; i++)
    {
      String sale_price_string = itemCartList[i].sale_price;
      int salePriceInt = int.parse(sale_price_string)*itemCartList[i].soluong;
      event.tongtien += salePriceInt;
    }
    // Emit the updated state
    emit(state.update(
      url: event.url,
      phone_name: event.phone_name,
      original_price: event.original_price,
      sale_price: event.sale_price,
      sold: event.sold,
      description: event.description,
      soluong: event.soluong,
      badge_count: event.badge_count,
      tongtien: event.tongtien,
    ));
  }

  onDeleteLead(DeleteCartItemEvent event, Emitter<CartState2> emit) {

    if (itemCartList.length == 1)
      {
        for (int i = 0; i < itemCartList.length; i++) {
            itemCartList.removeAt(i);
        }
        event.badge_count = itemCartList.length;
      }
    else
      {
        for (int i = 0; i < itemCartList.length; i++) {
          if (itemCartList[i].url == event.url &&
              itemCartList[i].phone_name == event.phone_name &&
              itemCartList[i].original_price == event.original_price &&
              itemCartList[i].sale_price == event.sale_price &&
              itemCartList[i].sold == event.sold &&
              itemCartList[i].description == event.description &&
              itemCartList[i].soluong == event.soluong
          )
          {
            itemCartList.removeAt(i);
          }
          event.badge_count = itemCartList.length;
        }
      }

    for (int i = 0; i < itemCartList.length; i++)
    {
      String sale_price_string = itemCartList[i].sale_price;
      int salePriceInt = int.parse(sale_price_string)*itemCartList[i].soluong;
      event.tongtien += salePriceInt;
    }

    emit(state.update(
      url: event.url,
      phone_name: event.phone_name,
      original_price: event.original_price,
      sale_price: event.sale_price,
      sold: event.sold,
      description: event.description,
      soluong: event.soluong,
      tongtien: event.tongtien,
      badge_count: event.badge_count,
    ));
  }

  onBadgeCountAfterPay(BadgeCountAfterPay event, Emitter<CartState2> emit) {
    event.badge_count = 0;

    emit(state.update(
      badge_count: event.badge_count,
    ));
  }

  onMinusQuantity(MinusQuantity event, Emitter<CartState2> emit)
  {
    for (int i = 0; i < itemCartList.length; i++) {
      if (itemCartList[i].phone_name == event.phone_name &&
          itemCartList[i].url == event.url && itemCartList[i].soluong == 1)
        {
          itemCartList.removeAt(i);

          break;
        }
      if (itemCartList[i].phone_name == event.phone_name &&
          itemCartList[i].url == event.url)
      {
        final updatedItem = CartClass(
          url: itemCartList[i].url,
          phone_name: itemCartList[i].phone_name,
          original_price: itemCartList[i].original_price,
          sale_price: itemCartList[i].sale_price,
          sold: itemCartList[i].sold,
          description: itemCartList[i].description,
          soluong: itemCartList[i].soluong - 1,
        );
        itemCartList[i] = updatedItem;
        break;
      }
    }
    for (int i = 0; i < itemCartList.length; i++)
    {
      String sale_price_string = itemCartList[i].sale_price;
      int salePriceInt = int.parse(sale_price_string)*itemCartList[i].soluong;
      event.tongtien += salePriceInt;
    }


    emit(state.update(
      url: event.url,
      phone_name: event.phone_name,
      original_price: event.original_price,
      sale_price: event.sale_price,
      sold: event.sold,
      description: event.description,
      soluong: event.soluong,
      tongtien: event.tongtien,
    ));
  }

}
