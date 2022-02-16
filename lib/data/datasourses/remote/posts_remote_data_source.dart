import 'package:dio/dio.dart';
import 'package:my_architecture/data/datasourses/remote/dio_helper.dart';

abstract class PostsRemoteDataSource{
  Future<Response> getPosts();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource{

  final DioHelper _dioHelper;

  PostsRemoteDataSourceImpl(this._dioHelper);

  @override
  Future<Response> getPosts() async => await _dioHelper.dio.get('/posts');
}