import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_architecture/dependency_injection.dart';
import 'package:my_architecture/presentation/cubit/posts_cubit.dart';
import 'package:my_architecture/presentation/views/home/widgets/posts_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocProvider<PostsCubit>(
        create: (_) => getIt(),
          child: const PostsListView()
      ),
    );
  }
}
