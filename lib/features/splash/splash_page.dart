import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:l1_domain/features/auth/export.dart';
import 'package:l2_presentation/features/auth/export.dart';
import 'package:thrillie/di.dart';
import 'package:thrillie/navigation/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) => BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
          DI.instance.get<IAuthenticationService>(),
        )..add(
            CheckAuthState(),
          ),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          child: Container(),
          listener: (context, state) async {
            final isAuthenticated = state.isAuthenticated;

            if (isAuthenticated != null) {
              final route =
                  isAuthenticated ? const HomeRoute() : const LoginRoute();

              FlutterNativeSplash.remove();

              await context.router.replace(route);
            }
          },
        ),
      );
}
