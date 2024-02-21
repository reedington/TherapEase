import 'package:another_flushbar/flushbar.dart';
import 'package:therapease/utils/utils.dart';

class ShowFlushBar {
  static void showError(
    String? error, {
    Duration? duration,
    void Function()? perform,
  }) async {
    final flushBar = Flushbar(
      backgroundColor: Colors.red.withOpacity(0.8),
      borderColor: Colors.red,
      borderRadius: BorderRadius.circular(8.r),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      messageText: Text(
        error ?? 'Something went wrong',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
      ),
      positionOffset: kBottomNavigationBarHeight.h,
      duration: duration ?? const Duration(seconds: 3),
    );
    flushBar.show(routes.routerDelegate.navigatorKey.currentContext!);
    await Future.delayed(const Duration(seconds: 1));
    flushBar.dismiss();
    if (perform != null) {
      perform();
    }
  }

  static void showSuccess({
    String? message,
    Duration? duration,
    void Function()? perform,
  }) async {
    final flushBar = Flushbar(
      backgroundColor: Colors.green.withOpacity(0.8),
      borderColor: Colors.green,
      borderRadius: BorderRadius.circular(8.r),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      messageText: Text(
        message ?? 'Successful',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
      ),
      positionOffset: kBottomNavigationBarHeight.h,
      duration: duration ?? const Duration(seconds: 3),
    );
    flushBar.show(routes.routerDelegate.navigatorKey.currentContext!);
    await Future.delayed(const Duration(seconds: 1));
    flushBar.dismiss();
    if (perform != null) {
      perform();
    }
  }
}
