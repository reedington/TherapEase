import 'package:flutter/gestures.dart';
import 'package:pinput/pinput.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';

class OtpScreen extends StatefulWidget {
  static const path = "/otp/:redirect";
  static const name = "otp";

  final String redirectPath;
  const OtpScreen({
    super.key,
    required this.redirectPath,
  });

  @override
  State<OtpScreen> createState() => OtpController();
}

class OtpController extends State<OtpScreen> {
  var buttonState = ValueNotifier(ButtonState(canSend: false));
  late TextEditingController passwordController;

  var showPassword = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    passwordController = TextEditingController()..addListener(() => _canSend());
  }

  void _canSend() {
    if (passwordController.text.trim().isNotEmpty &&
        passwordController.text.length == 4) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else {
      buttonState.value = buttonState.value.setCanSend(false);
    }
  }

  void logIn() {
    buttonState.value = buttonState.value.setIsSend(true);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      context.pushReplacementNamed(widget.redirectPath);
    }).catchError((error) {
      listenError(error: error);
    }).whenComplete(() {
      buttonState.value = buttonState.value.resetBoth();
    });
  }

  @override
  void dispose() {
    showPassword.dispose();
    passwordController.dispose();
    buttonState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OtpView(this);
  }
}
