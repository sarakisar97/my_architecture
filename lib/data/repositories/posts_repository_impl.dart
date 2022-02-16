import 'package:dio/dio.dart';
import 'package:my_architecture/data/datasourses/remote/posts_remote_data_source.dart';
import 'package:my_architecture/data/models/post_model.dart';
import 'package:my_architecture/domain/entities/post.dart';
import 'package:my_architecture/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository{

  final PostsRemoteDataSource _postsRemoteDataSource;

  PostsRepositoryImpl(this._postsRemoteDataSource);

  @override
  Future<List<Post>> getPosts() async {
    Response response = await _postsRemoteDataSource.getPosts();
    List<Post> posts = (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    return posts;
  }

}