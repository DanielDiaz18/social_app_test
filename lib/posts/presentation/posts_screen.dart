import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:social_app/posts/application/posts_bloc.dart';
import 'package:social_app/posts/presentation/post_card.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostsEventGet());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostsBloc>().state;
    final posts = state.posts;
    return LoadingOverlay(
      isLoading: state.isLoading,
      progressIndicator: const CircularProgressIndicator.adaptive(),
      child: Builder(builder: (context) {
        if (posts == null) return const SizedBox();
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return InkWell(
              onTap: () {
                context.push('/post/${post.id}');
              },
              child: PostCard(
                post: post,
              ),
            );
          },
        );
      }),
    );
  }
}
