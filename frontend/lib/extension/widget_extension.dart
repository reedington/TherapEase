import 'package:therapease/utils/utils.dart';

extension WidgetExtensions on List<num> {
  EdgeInsets get pad {
    assert(length <= 4, 'Length cannot be more than 4');
    assert(length != 3, 'Length cannot be 3');
    if (length == 1) {
      return EdgeInsets.symmetric(
        horizontal: this[0].w,
      );
    } else if (length == 4) {
      return EdgeInsets.only(
        left: this[0].w,
        top: this[1].h,
        right: this[2].w,
        bottom: this[3].h,
      );
    }
    return EdgeInsets.symmetric(
      horizontal: this[0].w,
      vertical: this[1].h,
    );
  }
}
