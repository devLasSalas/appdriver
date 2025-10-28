import 'package:go_router/go_router.dart';
import 'package:appdriver/presentation/pages/home/home_page.dart';
import 'package:appdriver/presentation/pages/auth/login_page.dart';
import 'package:appdriver/presentation/pages/auth/register_page.dart';
import 'package:appdriver/presentation/pages/onboarding/onboarding_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
