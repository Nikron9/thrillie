import 'package:l1_domain/features/user/export.dart';

class UserMemoryRepository implements IUserRepository {
  UserEntity? _user;

  @override
  Future<UserEntity> read() => Future.value(_user);

  @override
  Future write(UserEntity user) => Future.sync(() => _user = user);
}
