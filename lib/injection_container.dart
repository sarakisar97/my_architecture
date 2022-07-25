import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_architecture/core/network/network_info.dart';
import 'package:my_architecture/features/posts/domain/repositories/posts_repository.dart';
import 'package:my_architecture/features/posts/domain/usecases/get_posts.dart';
import 'core/network/network_service.dart';
import 'features/posts/data/datasourses/remote/posts_remote_data_source.dart';
import 'features/posts/data/repositories/posts_repository_impl.dart';
import 'features/posts/presentation/cubit/posts_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  ///External
  getIt.registerLazySingleton(() => InternetConnectionChecker());

  ///Core
  getIt.registerLazySingleton(() => DioAppInterceptors());
  getIt.registerLazySingleton<NetworkService>(() => DioNetworkService());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  ///Features - posts

  // DataSources
  getIt.registerLazySingleton<PostsRemoteDataSource>(() => PostsRemoteDataSourceImpl(getIt()));

  // Repositories
  getIt.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(getIt(), getIt()));

  // UseCases
  getIt.registerLazySingleton(() => GetPostsUseCase(getIt()));

  // Cubits
  getIt.registerFactory(() => PostsCubit(getIt()));
}