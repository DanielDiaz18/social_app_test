import 'dart:async';

import 'package:faker/faker.dart';
import 'package:social_app/user/domain/i_user_repo.dart';
import 'package:social_app/user/domain/user_model.dart';
import 'package:uuid/uuid.dart';

class UserFakeRepo extends IUserRepo {
  UserFakeRepo(this._uuid, this._faker);

  final Uuid _uuid;
  final Faker _faker;

  @override
  FutureOr<User> getUser() {
    final id = _uuid.v4();
    return Future.delayed(
      const Duration(seconds: 1),
      () => User(
        id: id,
        name: _faker.person.name(),
        email: _faker.internet.email(),
        avatar: 'https://i.pravatar.cc/150?u=$id',
      ),
    );
  }
}
