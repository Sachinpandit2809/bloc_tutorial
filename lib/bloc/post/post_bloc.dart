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

  void _onFilterList(SearchItem event, Emitter emit) async {
    tempPostList = state.postList
        .where((e) => e.title.toLowerCase().compareTo(event.strSearch));
    emit(state.copyWith());
  }
}
