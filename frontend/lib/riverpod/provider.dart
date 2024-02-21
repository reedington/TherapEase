import 'package:therapease/utils/utils.dart';

import 'notifier.dart';

final brightnessProvider =
    StateNotifierProvider<BrightnessNotifier, AppBrightness>(
  (ref) => BrightnessNotifier(LocalStorage.instance.getBrightness()),
);
