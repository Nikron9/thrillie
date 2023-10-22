import 'package:l1_domain/features/user/export.dart';

abstract class IUserRepository {
  Future write(UserEntity user);
  Future<UserEntity> read();
}
