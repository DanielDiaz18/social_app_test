import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_app/posts/domain/i_posts_facade.dart';
import 'package:social_app/posts/domain/post_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc(IPostsFacade facade) : super(PostsState.initial()) {
    on<PostsEventGet>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        final posts = await facade.getPosts();
        emit(state.copyWith(posts: posts, isLoading: false));
      } catch (err) {
        emit(state.copyWith(
            error: 'there is an unexpected error', isLoading: false));
      }
    });
    on<PostsEventGetDetail>((event, emit) async {
      try {
        emit(
            PostsState.initial().copyWith(posts: state.posts, isLoading: true));
        final post = await facade.getPost(event.id);
        emit(state.copyWith(post: post, isLoading: false));
      } catch (err) {
        emit(state.copyWith(
            error: 'there is an unexpected error', isLoading: false));
      }
    });
  }
}
