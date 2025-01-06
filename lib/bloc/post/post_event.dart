import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  PostEvent();

  List<Object> get props => [];
}

class FetchPost extends PostEvent {}

class SearchItem extends PostEvent {
  final String strSearch;
  SearchItem( this.strSearch);
}
