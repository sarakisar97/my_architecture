import 'package:dartz/dartz.dart';
import 'package:my_architecture/features/posts/data/datasourses/remote/posts_remote_data_source.dart';
import 'package:my_architecture/features/posts/domain/entities/post.dart';
import 'package:my_architecture/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

class PostsRepositoryImpl implements PostsRepository{

  final PostsRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  PostsRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    if(await _networkInfo.isConnected){
      try{
        List<Post> post = await _remoteDataSource.getPosts();
        return Right(post);
      } on ServerException catch(e){
        return Left(ServerFailure(e.message ?? e.toString()));
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}