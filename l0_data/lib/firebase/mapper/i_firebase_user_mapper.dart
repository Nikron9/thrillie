import 'package:firebase_auth/firebase_auth.dart';
import 'package:l0_data/dtos/export.dart';

abstract class IFirebaseUserMapper {
  UserDTO? map(UserCredential firebaseUser);
}
