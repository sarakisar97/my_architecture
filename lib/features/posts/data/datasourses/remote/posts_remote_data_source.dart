import 'package:dio/dio.dart';
import 'package:my_architecture/features/posts/data/models/post_model.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/network/end_points.dart';
import '../../../../../core/network/network_service.dart';

abstract class PostsRemoteDataSource{
  Future<List<PostModel>> getPosts();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource{

  final NetworkService _networkService;

  PostsRemoteDataSourceImpl(this._networkService);

  @override
  Future<List<PostModel>> getPosts() async {
    final Response response = await _networkService.get(EndPoints.getPosts);
    if(response.statusCode == 200){
      List<PostModel> posts = (response.data as List).map((e) => PostModel.fromJson(e)).toList();
      return posts;
    }else{
      throw ServerException();
    }
  }
}