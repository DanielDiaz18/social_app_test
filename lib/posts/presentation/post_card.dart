import 'package:flutter/material.dart';
import 'package:social_app/posts/domain/post_model.dart';
import 'package:social_app/user/presentation/user_avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatelessWidget {
  PostCard({required this.post}) : super(key: Key(post.id));

  final Post post;

  @override
  Widget build(BuildContext context) {
    final user = post.owner;
    final content = post.content;
    final image = post.image;
    return Card(
      child: Column(
        children: [
          ListTile(
              leading: UserAvatar(avatar: user.avatar),
              title: Text(user.name),
              subtitle: Text(
                timeago.format(post.createdAt),
              )),
          if (image != null)
            Image.network(
              image,
            ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content),
            ),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
                label: const Text('Like'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.thumb_down),
                label: const Text('Dislike'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.comment),
                label: const Text('Comments'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
