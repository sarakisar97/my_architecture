import 'package:dartz/dartz.dart';
import 'package:my_architecture/features/posts/domain/entities/post.dart';

import '../../../../core/error/failures.dart';

abstract class PostsRepository{
  Future<Either<Failure, List<Post>>> getPosts();
}