import 'package:my_architecture/domain/entities/post.dart';

abstract class PostsRepository{
  Future<List<Post>> getPosts();
}