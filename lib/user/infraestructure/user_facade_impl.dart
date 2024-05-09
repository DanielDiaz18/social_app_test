import 'package:social_app/user/domain/i_user_facade.dart';
import 'package:social_app/user/domain/i_user_repo.dart';
import 'package:social_app/user/domain/user_model.dart';

class UserFacadeImpl extends IUserFacade {
  UserFacadeImpl(this._repo);

  final IUserRepo _repo;

  @override
  Future<User> getUser() async {
    return _repo.getUser();
  }
}
