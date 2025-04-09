part of 'item_list_cubit.dart';

sealed class ItemListState {}

final class ItemListInitial extends ItemListState {}

final class ItemListLoading extends ItemListState {}

final class ItemListLoaded extends ItemListState {
  final List<Item> items;

  ItemListLoaded(this.items);
}

final class ItemListError extends ItemListState {
  final String message;

  ItemListError(this.message);
}
