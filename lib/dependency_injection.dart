import 'package:get_it/get_it.dart';
import 'package:my_architecture/data/datasourses/remote/dio_helper.dart';
import 'package:my_architecture/data/datasourses/remote/posts_remote_data_source.dart';
import 'package:my_architecture/data/repositories/posts_repository_impl.dart';
import 'package:my_architecture/domain/repositories/posts_repository.dart';
import 'package:my_architecture/presentation/cubit/posts_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => AppInterceptors());
  getIt.registerLazySingleton(() => DioHelper());
  getIt.registerLazySingleton<PostsRemoteDataSource>(() => PostsRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(getIt()));
  getIt.registerFactory(() => PostsCubit(getIt()));
}