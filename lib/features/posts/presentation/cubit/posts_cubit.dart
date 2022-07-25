import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_architecture/features/posts/domain/entities/post.dart';
import 'package:my_architecture/features/posts/domain/usecases/get_posts.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this._getPostsUseCase) : super(PostsInitial()){
    getPosts();
  }

  final GetPostsUseCase _getPostsUseCase;

  Future<void> getPosts() async {
    emit(PostsLoadInProgress());
    final failureOrPosts = await _getPostsUseCase();
    failureOrPosts.fold(
            (failure) => emit(PostsLoadFailure(failure.message)),
            (homeBlocks) => homeBlocks.isEmpty ? emit(PostsLoadEmpty()) : emit(PostsLoadSuccess(homeBlocks))
    );
  }
}
