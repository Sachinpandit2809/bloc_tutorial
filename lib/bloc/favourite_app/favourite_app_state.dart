import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { LOADING, SUCCESS, FAILURE }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempFavouriteItemList;


  final ListStatus listStatus;

  const FavouriteAppState(
      {this.favouriteItemList = const [],
      this.tempFavouriteItemList = const [],

      this.listStatus = ListStatus.LOADING});

  FavouriteAppState copyWith(
      {List<FavouriteItemModel>? favouriteItemList,List<FavouriteItemModel>? tempFavouriteItemList, ListStatus? listStatus}) {
    return FavouriteAppState(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        tempFavouriteItemList: tempFavouriteItemList ?? this.tempFavouriteItemList,

        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object> get props => [favouriteItemList, tempFavouriteItemList, listStatus];
}

// final class FavouriteAppInitial extends FavouriteAppState {}
