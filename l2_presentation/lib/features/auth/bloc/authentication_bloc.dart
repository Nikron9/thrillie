import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l1_domain/features/auth/export.dart';
import 'package:l2_presentation/features/auth/export.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
    this.authenticationService,
  ) : super(
          const AuthenticationState(
            isAuthenticated: null,
          ),
        ) {
    on<CheckAuthState>(checkAuthState);
  }

  final IAuthenticationService authenticationService;

  Future<void> checkAuthState(
    CheckAuthState event,
    Emitter<AuthenticationState> emitter,
  ) async {
    final authState = await authenticationService.authState.first;

    emitter.call(
      state.copyWith(
        isAuthenticated: authState == AuthState.authorized,
      ),
    );
  }
}
