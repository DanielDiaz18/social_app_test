part of 'posts_bloc.dart';

final class PostsState extends Equatable {
  const PostsState({
    required this.isLoading,
    this.error,
    List<Post>? posts,
    this.post,
  }) : _posts = posts;

  factory PostsState.initial() => const PostsState(isLoading: false);

  final String? error;
  final bool isLoading;
  final List<Post>? _posts;
  final Post? post;

  UnmodifiableListView<Post>? get posts =>
      _posts != null ? UnmodifiableListView<Post>(_posts) : null;

  PostsState copyWith({
    bool? isLoading,
    String? error,
    List<Post>? posts,
    Post? post,
  }) {
    return PostsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      posts: posts ?? _posts,
      post: post ?? this.post,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        posts,
      ];
}
