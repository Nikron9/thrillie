enum RoutePath {
  splash(path: '/'),
  onboarding(path: '/onboarding'),
  login(path: '/login'),
  home(path: '/home');

  const RoutePath({
    required this.path,
  });

  final String path;
}
