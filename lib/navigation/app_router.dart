import 'package:auto_route/auto_route.dart';
import 'package:thrillie/navigation/export.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
          path: RoutePath.splash.path,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: RoutePath.onboarding.path,
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: RoutePath.login.path,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: RoutePath.home.path,
        ),
      ];
}
