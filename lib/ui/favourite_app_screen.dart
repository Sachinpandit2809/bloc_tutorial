import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite app"),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.LOADING:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.FAILURE:
              return const Center(child: Text("Failed"));
            case ListStatus.SUCCESS:
              return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];

                    return Card(
                        child: ListTile(
                      leading: Checkbox(value: true, onChanged: (v) {}),
                      title: Text(item.value.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            FavouriteItemModel favouriteItem =
                                FavouriteItemModel(
                                    id: item.id,
                                    value: item.value,
                                    isFavourite:
                                        item.isFavourite ? false : true);
                            context
                                .read<FavouriteAppBloc>()
                                .add(AddFavouriteItem(item: favouriteItem));
                          },
                          icon: Icon(
                            item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: item.isFavourite ? Colors.red : Colors.white,
                          )),
                    ));
                  });
          }
        }),
      ),
    );
  }
}
