import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/core/routers/main_routes.dart';
import 'package:spotify_clone/src/core/routers/sign_up_routes.dart';
import 'package:spotify_clone/src/core/routers/song_routes.dart';
import 'package:spotify_clone/src/modules/welcome/screens/welcome_screen.dart';

const welcome = '/welcome';

final rootRoutes = <GoRoute>[
  GoRoute(path: welcome, builder: (_, __) => const WelcomeScreen()),
  ...signUpRoutes,
  ...mainRoutes,
  ...songRoutes,
];
