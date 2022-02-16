import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_architecture/presentation/cubit/posts_cubit.dart';
import 'package:my_architecture/presentation/views/components/components.dart';
import 'package:my_architecture/presentation/views/components/error_viewer.dart';
import 'package:my_architecture/presentation/views/home/widgets/post_item.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if(state is PostsLoadSuccess){
          return ListView.separated(
              itemBuilder: (context, index) {
                return PostItem(
                    title: state.posts[index].title!,
                    subtitle: state.posts[index].body!
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20.0),
              itemCount: state.posts.length
          );
        }
        else if(state is PostsLoadEmpty){
          return const NoElementsWidget();
        }
        else if(state is PostsLoadFailure){
          return ErrorViewer(
              errorText: state.error,
              onRetryClicked: () => context.read<PostsCubit>().getPosts()
          );
        }
        else{
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
