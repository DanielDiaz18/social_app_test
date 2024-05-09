import 'package:faker/faker.dart';
import 'package:social_app/posts/domain/i_posts_repo.dart';
import 'package:social_app/posts/domain/post_model.dart';
import 'package:social_app/user/domain/user_model.dart';
import 'package:uuid/uuid.dart';

class PostsFakeRepo extends IPostsRepo {
  PostsFakeRepo(this._uuid, this._faker);

  final Uuid _uuid;
  final Faker _faker;

  List<Post>? _posts;

  @override
  Future<List<Post>> getPosts() async {
    final posts = await Future.delayed(
      const Duration(seconds: 2),
      () => List.generate(
        10,
        (index) {
          final userId = _uuid.v4();
          final user = User(
            id: userId,
            name: _faker.person.name(),
            email: _faker.internet.email(),
            avatar: 'https://i.pravatar.cc/150?u=$userId',
          );

          final now = DateTime.now();
          final postId = _uuid.v4();
          return Post(
            id: postId,
            owner: user,
            content: _faker.lorem.sentence(),
            image: 'https://picsum.photos/500?id=$postId',
            createdAt: _faker.date
                .dateTimeBetween(now.subtract(const Duration(hours: 1)), now),
          );
        },
      ),
    );
    _posts = posts;
    return posts;
  }

  @override
  Future<Post> getPost(String id) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => _posts!.firstWhere((e) => e.id == id),
    );
  }
}
