import 'package:social_app/user/domain/user_model.dart';

abstract class IUserFacade {
  Future<User> getUser();
}
