import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:bloc_tutorial/repository/favourite_repositry.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteRepositry favouriteRepositry;
  List<FavouriteItemModel> favouriteItemList = [];
  FavouriteAppBloc(
    this.favouriteRepositry,
  ) : super(const FavouriteAppState()) {
    on<FetchFavouriteList>(_onFetchFavouriteList);
    on<AddFavouriteItem>(_onAddFavouriteItem);
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
    favouriteItemList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteItemList)));
  }
}
