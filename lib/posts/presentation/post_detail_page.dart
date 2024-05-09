import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:social_app/posts/application/posts_bloc.dart';
import 'package:social_app/posts/presentation/post_card.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key, required this.postId});

  final String postId;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostsEventGetDetail(widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostsBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: LoadingOverlay(
        isLoading: state.isLoading,
        child: Builder(builder: (context) {
          final post = state.post;
          if (post == null) return const SizedBox();
          return PostCard(post: post);
        }),
      ),
    );
  }
}
