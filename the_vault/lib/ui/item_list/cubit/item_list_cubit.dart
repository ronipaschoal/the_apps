import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_vault/domain/models/item/item.dart';

part 'item_list_state.dart';

class ItemListCubit extends Cubit<ItemListState> {
  ItemListCubit(BuildContext context) : super(ItemListInitial()) {
    emit(ItemListLoading());

    Future.delayed(const Duration(seconds: 2), () {
      final items = [
        Item(
          id: '1',
          name: 'Carta de Magic',
          description: 'Mint condition Magic card',
          type: 'Type A',
          icon: 'icon1.png',
          image: 'image1.png',
        ),
        Item(
          id: '2',
          name: 'Book',
          description: 'Book in good condition',
          type: 'Type B',
          icon: 'icon2.png',
          image: 'image2.png',
        ),
      ];

      emit(ItemListLoaded(items));
    });
  }
}
