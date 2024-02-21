import 'package:therapease/utils/utils.dart';

extension NumberSplitter on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool get isValidEmail {
    return RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(
      trim(),
    );
  }

  AppBrightness get brightness {
    switch (this) {
      case 'light':
        return AppBrightness.light;
      case 'light-S':
        return AppBrightness.systemLight;
      case 'dark':
        return AppBrightness.dark;
      default:
        return AppBrightness.systemDark;
    }
  }
}

extension ThemeBrightness on AppBrightness {
  bool get isDark {
    switch (this) {
      case AppBrightness.dark:
        return true;
      case AppBrightness.systemDark:
        return true;
      case AppBrightness.light:
        return false;
      case AppBrightness.systemLight:
        return false;
      case AppBrightness.none:
        return false;
    }
  }
}
