import 'package:flutter/gestures.dart';
import 'package:therapease/requests/users/model.dart';
import 'package:therapease/requests/users/network.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';

class PasswordScreen extends StatefulWidget {
  static const path = "password";
  static const name = "password";
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => PasswordController();
}

class PasswordController extends State<PasswordScreen> {
  var buttonState = ValueNotifier(ButtonState(canSend: false));
  late TextEditingController passwordController;
  late TextEditingController confirmController;
  var showPassword = ValueNotifier(false);
  var showConfirm = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController()..addListener(() => _canSend());
    confirmController = TextEditingController()..addListener(() => _canSend());
  }

  void _canSend() {
    if (passwordController.text.trim().isNotEmpty &&
        confirmController.text.trim().isNotEmpty &&
        passwordController.text == confirmController.text) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else {
      buttonState.value = buttonState.value.setCanSend(false);
    }
  }

  void submitPassword() {
    buttonState.value = buttonState.value.setIsSend(true);
    UsersRequest.instance
        .createUser(
      user: CreateUser(
        password: passwordController.text,
      ),
    )
        .then((value) {
      if (mounted) {
        context.replaceNamed(DetailsScreen.name);
      }
    }).catchError((error) {
      context.replaceNamed(DetailsScreen.name);
      //w
    }).whenComplete(() {
      buttonState.value = buttonState.value.resetBoth();
    });
  }

  @override
  void dispose() {
    showPassword.dispose();
    buttonState.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PasswordView(this);
  }
}
