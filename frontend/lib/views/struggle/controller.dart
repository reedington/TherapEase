import 'package:therapease/requests/users/model.dart';
import 'package:therapease/requests/users/network.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';
part 'model.dart';
part 'success.dart';

class StruggleScreen extends StatefulWidget {
  static const path = "struggle";
  static const name = "struggle";

  final CreateUser user;
  const StruggleScreen({
    super.key,
    required this.user,
  });

  @override
  State<StruggleScreen> createState() => StruggleController();
}

class StruggleController extends State<StruggleScreen> {
  var struggles = [
    Struggles(text: 'Sexual Addiction'),
    Struggles(text: 'Substance Abuse'),
    Struggles(text: 'Gambling Addiction'),
    Struggles(text: 'Food Addiction'),
    Struggles(text: 'Gaming Addiction'),
    Struggles(text: 'Internet Addiction'),
    Struggles(text: 'Pornography Addiction'),
    Struggles(text: 'Phone Addiction'),
  ];
  var buttonState = ValueNotifier(ButtonState(canSend: false));

  void finishSetup() {
    buttonState.value = buttonState.value.setIsSend(true);
    widget.user.struggle = [...struggles]
        .where((element) => element.isStruggling = true)
        .map((e) => e.text)
        .toList();
    UsersRequest.instance.createUser(user: widget.user).then((value) {
      context.pushTo(const SuccessCreation());
    }).catchError((error) {
      listenError(error: error);
    }).whenComplete(() {
      buttonState.value = buttonState.value.resetBoth();
    });
  }

  void _canSend() {
    if (struggles.any((element) => element.isStruggling)) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else {
      buttonState.value = buttonState.value.setCanSend(false);
    }
  }

  @override
  void dispose() {
    buttonState.dispose();
    super.dispose();
  }

  void rebuild() => setState(() => _canSend());

  @override
  Widget build(BuildContext context) {
    return StruggleView(this);
  }
}
