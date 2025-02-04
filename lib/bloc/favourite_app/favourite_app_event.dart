import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvent {}

class AddFavouriteItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  const AddFavouriteItem({required this.item});
}

class SelectItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  const SelectItem({required this.item});
}

class UnSelectItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  const UnSelectItem({required this.item});
}

class DeleteItem extends FavouriteAppEvent {}
