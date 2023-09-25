enum AppRoutes {
  homeView(
    name: 'Home',
    path: '/path',
  );

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;

  final String path;

  @override
  String toString() => name;
}
