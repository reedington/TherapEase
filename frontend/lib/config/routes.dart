import 'package:therapease/requests/users/model.dart';
import 'package:therapease/utils/utils.dart';

class FadeTransitionPage extends CustomTransitionPage {
  const FadeTransitionPage({
    required super.child,
    required super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: CurveTween(curve: Curves.bounceInOut).animate(animation),
        child: child,
      );
}

final GoRouter routes = GoRouter(
  initialLocation: OnboardingScreen.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: SampleScreen.path,
      name: SampleScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const SampleScreen(),
        );
      },
    ),
    GoRoute(
      path: OnboardingScreen.path,
      name: OnboardingScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
        );
      },
    ),
    GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: OtpScreen.path,
      name: OtpScreen.name,
      pageBuilder: (context, state) {
        String redirect = state.pathParameters['redirect']!;
        return FadeTransitionPage(
          key: state.pageKey,
          child: OtpScreen(
            redirectPath: redirect,
          ),
        );
      },
    ),
    GoRoute(
      path: SignupScreen.path,
      name: SignupScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const SignupScreen(),
        );
      },
      routes: [
        GoRoute(
          path: PasswordScreen.path,
          name: PasswordScreen.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(
              key: state.pageKey,
              child: const PasswordScreen(),
            );
          },
        ),
        GoRoute(
          path: DetailsScreen.path,
          name: DetailsScreen.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(
              key: state.pageKey,
              child: const DetailsScreen(),
            );
          },
        ),
        GoRoute(
          path: StruggleScreen.path,
          name: StruggleScreen.name,
          pageBuilder: (context, state) {
            final CreateUser user =
                CreateUser.fromJson(state.extra! as Map<String, dynamic>);
            return FadeTransitionPage(
              key: state.pageKey,
              child: StruggleScreen(
                user: user,
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: MainScreen.path,
      name: MainScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const MainScreen(),
        );
      },
    ),
    GoRoute(
      path: IntroScreen.path,
      name: IntroScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const IntroScreen(),
        );
      },
    ),
    GoRoute(
      path: GuidelineScreen.path,
      name: GuidelineScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const GuidelineScreen(),
        );
      },
    ),
    GoRoute(
      path: ListeningScreen.path,
      name: ListeningScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const ListeningScreen(),
        );
      },
    ),
    GoRoute(
      path: CreateNexusScreen.path,
      name: CreateNexusScreen.name,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const CreateNexusScreen(),
        );
      },
    ),
  ],
);
