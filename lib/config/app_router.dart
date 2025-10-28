import 'package:go_router/go_router.dart';
import 'package:appdriver/presentation/pages/home/home_page.dart';
import 'package:appdriver/presentation/pages/auth/login_page.dart';
// import 'package:appdriver/presentation/pages/auth/register_page.dart';
import 'package:appdriver/presentation/pages/auth/register_number_page.dart';
import 'package:appdriver/presentation/pages/auth/verify_otp_page.dart';
import 'package:appdriver/presentation/pages/auth/complete_profile_page.dart';
import 'package:appdriver/presentation/pages/onboarding/onboarding_page.dart';
import 'package:appdriver/presentation/pages/splash/splash_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register-number',
      builder: (context, state) => const RegisterNumberPage(),
    ),
    GoRoute(
      path: '/verify-otp',
      builder: (context, state) => const VerifyOtpPage(),
    ),
    GoRoute(
      path: '/complete-profile',
      builder: (context, state) => const CompleteProfilePage(),
    ),
    // La ruta de registro anterior ya no es necesaria con el nuevo flujo
    // GoRoute(
    //   path: '/register',
    //   builder: (context, state) => const RegisterPage(),
    // ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
