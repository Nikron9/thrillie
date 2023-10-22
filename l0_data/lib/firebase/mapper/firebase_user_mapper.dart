import 'package:firebase_auth/firebase_auth.dart';
import 'package:l0_data/dtos/model/user/user_dto.dart';
import 'package:l0_data/firebase/export.dart';

class FirebaseUserMapper implements IFirebaseUserMapper {
  @override
  UserDTO? map(UserCredential firebaseUser) {
    final userData = firebaseUser.user;
    return userData != null ? UserDTO(userData.uid) : null;
  }
}
