import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:social_app/posts/application/posts_bloc.dart';
import 'package:social_app/posts/domain/i_posts_facade.dart';
import 'package:social_app/posts/domain/i_posts_repo.dart';
import 'package:social_app/posts/infraestructure/posts_facade_impl.dart';
import 'package:social_app/posts/infraestructure/posts_fake_repo.dart';
import 'package:social_app/user/application/user_bloc.dart';
import 'package:social_app/user/domain/i_user_facade.dart';
import 'package:social_app/user/domain/i_user_repo.dart';
import 'package:social_app/user/infraestructure/user_facade_impl.dart';
import 'package:social_app/user/infraestructure/user_fake_repo.dart';
import 'package:uuid/uuid.dart';

final getIt = GetIt.instance;

Future<void> configInjection() async {
  getIt.registerFactory(Faker.new);
  getIt.registerFactory(Uuid.new);

  // user
  getIt.registerFactory<IUserRepo>(
      () => UserFakeRepo(getIt<Uuid>(), getIt<Faker>()));
  getIt.registerFactory<IUserFacade>(() => UserFacadeImpl(getIt<IUserRepo>()));
  getIt.registerFactory(() => UserBloc(getIt<IUserFacade>()));

  // posts
  getIt.registerFactory<IPostsRepo>(
      () => PostsFakeRepo(getIt<Uuid>(), getIt<Faker>()));
  getIt.registerFactory<IPostsFacade>(
      () => PostsFacadeImpl(getIt<IPostsRepo>()));
  getIt.registerFactory(() => PostsBloc(getIt<IPostsFacade>()));
}
