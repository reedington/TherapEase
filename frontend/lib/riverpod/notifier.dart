import 'package:therapease/utils/utils.dart';

class BrightnessNotifier extends StateNotifier<AppBrightness> {
  BrightnessNotifier(super.state);

  void setBrightness(AppBrightness value, [String? name]) async {
    await LocalStorage.instance.setAppBrightness(value, name);
    state = value;
  }

  void toggleTheme() async {
    if ([AppBrightness.dark, AppBrightness.systemDark].contains(state)) {
      if (state == AppBrightness.systemDark) {
        await LocalStorage.instance.setAppBrightness(
          AppBrightness.systemLight,
          'light',
        );
        state = AppBrightness.systemLight;
      } else {
        await LocalStorage.instance.setAppBrightness(AppBrightness.light);
        state = AppBrightness.light;
      }
    } else {
      if (state == AppBrightness.systemLight) {
        await LocalStorage.instance.setAppBrightness(
          AppBrightness.systemDark,
          'dark',
        );
        state = AppBrightness.systemDark;
      } else {
        await LocalStorage.instance.setAppBrightness(AppBrightness.dark);
        state = AppBrightness.dark;
      }
    }
  }
}
