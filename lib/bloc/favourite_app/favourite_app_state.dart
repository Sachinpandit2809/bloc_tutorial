import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { LOADING, SUCCESS, FAILURE }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final ListStatus listStatus;

  const FavouriteAppState(
      {this.favouriteItemList = const [],
      this.listStatus = ListStatus.LOADING});

  FavouriteAppState copyWith(
      {List<FavouriteItemModel>? favouriteItemList, ListStatus? listStatus}) {
    return FavouriteAppState(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object> get props => [favouriteItemList, listStatus];
}

// final class FavouriteAppInitial extends FavouriteAppState {}
