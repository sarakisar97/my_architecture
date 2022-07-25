part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();
}

class PostsInitial extends PostsState {
  @override
  List<Object> get props => [];
}
class PostsLoadInProgress extends PostsState {
  @override
  List<Object> get props => [];
}
class PostsLoadSuccess extends PostsState {
  final List<Post> posts;
  const PostsLoadSuccess(this.posts);
  @override
  List<Object> get props => [posts];
}
class PostsLoadEmpty extends PostsState {
  @override
  List<Object> get props => [];
}
class PostsLoadFailure extends PostsState {
  final String error;

  const PostsLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
