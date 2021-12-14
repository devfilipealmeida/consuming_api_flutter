import '../model/user_model.dart';

abstract class IUserRepository {
  Future<List<UserModel>> findAllUsers();
}