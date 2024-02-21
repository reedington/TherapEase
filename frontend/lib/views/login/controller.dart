import 'package:flutter/gestures.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';

class LoginScreen extends StatefulWidget {
  static const path = "/login";
  static const name = "login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  var buttonState = ValueNotifier(ButtonState(canSend: false));
  late TextEditingController emailEditingController;
  late TextEditingController passwordController;

  var showPassword = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    emailEditingController = TextEditingController()
      ..addListener(() => _canSend());
    passwordController = TextEditingController()..addListener(() => _canSend());
  }

  void _canSend() {
    if (emailEditingController.text.trim().isNotEmpty &&
        emailEditingController.text.isValidEmail &&
        passwordController.text.trim().isNotEmpty) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else {
      buttonState.value = buttonState.value.setCanSend(false);
    }
  }

  void logIn() {
    buttonState.value = buttonState.value.setIsSend(true);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      context.pushNamed(IntroScreen.name);
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
    showPassword.dispose();
    passwordController.dispose();
    emailEditingController.dispose();
    buttonState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(this);
  }
}
