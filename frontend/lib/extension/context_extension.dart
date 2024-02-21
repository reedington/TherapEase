import 'package:therapease/utils/utils.dart';

extension ContextExtension on BuildContext {
  Future<T?> pushTo<T extends Object?>(Widget child) {
    return Navigator.of(this).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  Future<T?> goTo<T extends Object?>(Widget child) {
    return Navigator.pushAndRemoveUntil(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }

  void popTo<T extends Object?>([T? result, bool routeNavigator = false]) {
    return Navigator.of(this, rootNavigator: routeNavigator).pop(result);
  }

  // CustomTheme get getTheme => Theme.of(this).extension<CustomTheme>()!;
}
