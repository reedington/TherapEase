import 'package:flutter/gestures.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';

class SignupScreen extends StatefulWidget {
  static const path = "/signup";
  static const name = "signup";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupController();
}

class SignupController extends State<SignupScreen> {
  var buttonState = ValueNotifier(ButtonState(canSend: false));
  late TextEditingController emailEditingController;

  @override
  void initState() {
    super.initState();
    emailEditingController = TextEditingController()
      ..addListener(() => _canSend());
  }

  void _canSend() {
    if (emailEditingController.text.trim().isNotEmpty &&
        emailEditingController.text.isValidEmail) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else {
      buttonState.value = buttonState.value.setCanSend(false);
    }
  }

  void signUp() {
    buttonState.value = buttonState.value.setIsSend(true);
    ApiRequest.instance
        .validateEmail(email: emailEditingController.text)
        .then((value) {
      context.pushNamed(
        OtpScreen.name,
        pathParameters: {
          'redirect': PasswordScreen.name,
        },
      );
    }).catchError((error) {
      listenError(error: error);
    }).whenComplete(() {
      buttonState.value = buttonState.value.resetBoth();
    });
  }

  void googleSignin() {
    AuthRequest.instance.googleLogin().then((value) {}).catchError((error) {
      listenError(error: error);
    }).whenComplete(() {
      buttonState.value = buttonState.value.resetBoth();
    });
  }

  @override
  void dispose() {
    buttonState.dispose();
    emailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignupView(this);
  }
}
