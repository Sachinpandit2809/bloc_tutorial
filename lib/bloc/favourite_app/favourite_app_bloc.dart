import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:bloc_tutorial/repository/favourite_repositry.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteRepositry favouriteRepositry;
  List<FavouriteItemModel> favouriteItemList = [];
  List<FavouriteItemModel> tempFavouriteItemList = [];

  FavouriteAppBloc(
    this.favouriteRepositry,
  ) : super(const FavouriteAppState()) {
    on<FetchFavouriteList>(_onFetchFavouriteList);
    on<AddFavouriteItem>(_onAddFavouriteItem);
    on<SelectItem>(_onSelectItem);
    on<UnSelectItem>(_onUnSelectItem);
    on<DeleteItem>(_onDeleteItem);
  }
  void _onFetchFavouriteList(
      FetchFavouriteList event, Emitter<FavouriteAppState> emit) async {
    favouriteItemList = await favouriteRepositry.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteItemList),
        listStatus: ListStatus.SUCCESS));
  }

  void _onAddFavouriteItem(
      AddFavouriteItem event, Emitter<FavouriteAppState> emit) {
    final index =
        favouriteItemList.indexWhere((element) => element.id == event.item.id);
    if (event.item.isFavourite) {
      if (tempFavouriteItemList.contains(favouriteItemList[index])) {
        tempFavouriteItemList.remove(favouriteItemList[index]);
        tempFavouriteItemList.add(event.item);
      }
    } else {
      if (tempFavouriteItemList.contains(favouriteItemList[index])) {
        tempFavouriteItemList.remove(favouriteItemList[index]);
        tempFavouriteItemList.add(event.item);
      }
    }
    favouriteItemList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteItemList),tempFavouriteItemList: List.from(tempFavouriteItemList) ));
  }

  void _onSelectItem(SelectItem event, Emitter<FavouriteAppState> emit) {
    tempFavouriteItemList.add(event.item);
    emit(state.copyWith(
        tempFavouriteItemList: List.from(tempFavouriteItemList)));
  }

  void _onUnSelectItem(UnSelectItem event, Emitter<FavouriteAppState> emit) {
    tempFavouriteItemList.remove(event.item);

    emit(state.copyWith(
        tempFavouriteItemList: List.from(tempFavouriteItemList)));
  }

  void _onDeleteItem(DeleteItem event, Emitter<FavouriteAppState> emit) {
    for (int i = 0; i < tempFavouriteItemList.length; i++) {
      favouriteItemList.remove(tempFavouriteItemList[i]);
    }
    tempFavouriteItemList.clear();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteItemList),
        tempFavouriteItemList: List.from(tempFavouriteItemList)));
  }
}
