// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    required this.isAuthenticated,
  });

  final bool? isAuthenticated;

  @override
  List<Object?> get props => [
        isAuthenticated,
      ];

  AuthenticationState copyWith({
    bool? isAuthenticated,
  }) =>
      AuthenticationState(
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      );
}
