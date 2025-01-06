import 'package:bloc_tutorial/model/post_model.dart';
import 'package:bloc_tutorial/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;

  final String message;
  const PostState(
      {this.message = "",
      this.tempPostList = const <PostModel>[],
      this.postList = const <PostModel>[],
      this.postStatus = PostStatus.LOADING});

  PostState copyWith(
      { List<PostModel>? tempPostList, PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostState(
        message: message ?? this.message,
        postList: postList ?? this.postList,
        tempPostList: tempPostList ?? this.tempPostList,

        postStatus: postStatus ?? this.postStatus);
  }

  @override
  List<Object> get props => [postStatus, postList, tempPostList, message];
}
