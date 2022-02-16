import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_architecture/domain/entities/post.dart';
import 'package:my_architecture/domain/repositories/posts_repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this._postsRepository) : super(PostsInitial()){
    getPosts();
  }

  final PostsRepository _postsRepository;

  Future<void> getPosts() async {
    emit(PostsLoadInProgress());
    try{
      final List<Post> posts = await _postsRepository.getPosts();
      if(posts.isEmpty){
        emit(PostsLoadEmpty());
      }
      else{
        emit(PostsLoadSuccess(posts));
      }
    }catch(error){
      emit(PostsLoadFailure(error.toString()));
    }
  }
}
