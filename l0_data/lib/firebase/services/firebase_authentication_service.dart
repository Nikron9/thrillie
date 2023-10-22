import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:l0_data/firebase/export.dart';
import 'package:l1_domain/features/auth/export.dart';
import 'package:l1_domain/storage/export.dart';

class FirebaseAuthenticationService implements IAuthenticationService {
  FirebaseAuthenticationService({
    required this.userMapper,
    required this.storageService,
  });

  final IFirebaseUserMapper userMapper;
  final IStorageService storageService;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<AuthState> get authState => _auth.authStateChanges().map(
        (state) => state != null ? AuthState.authorized : AuthState.expired,
      );

  @override
  Future<void> signIn(
    String email,
    String password,
  ) async {
    final userData = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await mapAndStoreUserData(userData);
  }

  @override
  Future<void> signUpByEmail(
    String email,
    String password,
  ) async {
    final userData = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await mapAndStoreUserData(userData);
  }

  Future<void> mapAndStoreUserData(UserCredential userData)async {
    final userDTO = userMapper.map(userData);

    if (userDTO != null) {
      await storageService.write(
        userDTO.toString(),
        userDTO.toJson(),
      );
    }
  }
}
