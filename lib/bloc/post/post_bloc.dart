import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/post/post_event.dart';
import 'package:bloc_tutorial/bloc/post/post_state.dart';
import 'package:bloc_tutorial/model/post_model.dart';
import 'package:bloc_tutorial/repository/post_repository.dart';
import 'package:bloc_tutorial/utils/enums.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> tempPostList = [];
  final PostRepository _postRepository = PostRepository();
  PostBloc() : super(const PostState()) {
    on<FetchPost>(_onFetchPost);
    on<SearchItem>(_onFilterList);
  }
  void _onFetchPost(FetchPost event, Emitter emit) async {
    await _postRepository.fetchPostApi().then((v) {
      emit(state.copyWith(
          postStatus: PostStatus.SUCCESS, message: "success", postList: v));
    }).onError((error, StackTrace) {
      emit(state.copyWith(
          postStatus: PostStatus.FAILURE, message: error.toString()));
    });
  }

  // steps
  // checking the search bar is empty or not..
  // if not empty then equate the id with searchale words;
  // if no data found in temp list beacuse nothing matched in searching
  //  if something found then we send temp list

  void _onFilterList(SearchItem event, Emitter emit) async {
    // checking the search bar is empty or not..
    if (event.strSearch.isEmpty) {
      emit(state.copyWith(tempPostList: [], searchMessage: ''));
    } else {
      // if not empty then equate the id with searchale words;
      // tempPostList = state.postList
      //     .where((e) =>
      //         e.id.toString().toLowerCase() == event.strSearch.toLowerCase())
      //     .toList();
      tempPostList = state.postList
          .where((e) => e.title
              .toString()
              .toLowerCase()
              .contains(event.strSearch.toLowerCase()))
          .toList();
      // if no data found in temp list beacuse nothing matched in searching
      if (tempPostList.isEmpty) {
        emit(state.copyWith(
            tempPostList: tempPostList, searchMessage: "No data found"));
      }
      //  if something found then we send temp list
      // exception condition for searchMessage that  after not matched
      //then match so that we have to send the searchMessage to ""
      else {
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: ''));
      }
    }
  }
}
