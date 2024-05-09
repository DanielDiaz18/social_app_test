part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

final class PostsEventGet extends PostsEvent {}

final class PostsEventGetDetail extends PostsEvent {
  const PostsEventGetDetail(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
