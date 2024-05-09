import 'package:social_app/posts/domain/post_model.dart';

abstract class IPostsFacade {
  Future<List<Post>> getPosts();
  Future<Post> getPost(String id);
}
