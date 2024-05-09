import 'dart:async';

import 'package:social_app/user/domain/user_model.dart';

abstract class IUserRepo {
  FutureOr<User> getUser();
}
