import 'dart:developer';

import 'package:therapease/utils/utils.dart';

void listenError({required Object error}) {
  debugPrint('$error');
  if (error is DioException) {
    log('${error.response}');
    if (error.response != null && error.response?.data is Map) {
      // var err = CustomError.fromJson(error.response?.data);
      ShowFlushBar.showError('something');
    } else {
      ShowFlushBar.showError('Check your internet connection');
    }
  } else {
    ShowFlushBar.showError('Something went wrong');
  }
}

class LowercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
