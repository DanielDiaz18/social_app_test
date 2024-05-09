import 'package:social_app/posts/domain/i_posts_facade.dart';
import 'package:social_app/posts/domain/i_posts_repo.dart';
import 'package:social_app/posts/domain/post_model.dart';

class PostsFacadeImpl extends IPostsFacade {
  PostsFacadeImpl(this._repo);

  final IPostsRepo _repo;

  @override
  Future<List<Post>> getPosts() {
    return _repo.getPosts();
  }

  @override
  Future<Post> getPost(String id) {
    return _repo.getPost(id);
  }
}
