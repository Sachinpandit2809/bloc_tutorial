import 'package:bloc_tutorial/model/favourite_item_model.dart';

class FavouriteRepositry {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(10));
  }

//  Generating the 10  Item List of FavouriteItemModel
  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemModel(id: index.toString(), value: "Item $index"));
  }
}
