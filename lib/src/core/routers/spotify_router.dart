import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/modules/welcome/screens/welcome_screen.dart';

const _welcome = '/welcome';

final router = GoRouter(
  initialLocation: _welcome,
  routes: [
    GoRoute(path: _welcome, builder: (_, __) => const WelcomeScreen()),
  ],
);
