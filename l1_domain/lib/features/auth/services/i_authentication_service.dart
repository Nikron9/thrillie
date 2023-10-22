import 'dart:async';

import 'package:l1_domain/features/auth/export.dart';

abstract class IAuthenticationService {
  Stream<AuthState> get authState;

  Future<void> signIn(
    String email,
    String password,
  );

  Future<void> signUpByEmail(
    String email,
    String password,
  );
}
