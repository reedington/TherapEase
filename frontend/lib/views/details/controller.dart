import 'package:therapease/requests/users/model.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';
part 'enum.dart';
part 'modal.dart';

class DetailsScreen extends StatefulWidget {
  static const path = "details";
  static const name = "details";
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => DetailsController();
}

class DetailsController extends State<DetailsScreen> {
  var buttonState = ValueNotifier(ButtonState(canSend: false));
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController userNameController;
  late TextEditingController genderController;
  late TextEditingController ageController;
  var detailSection = ValueNotifier(DetailSection.name);

  var user = CreateUser();
  Gender? gender;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController()
      ..addListener(() => _canSend());
    userNameController = TextEditingController()..addListener(() => _canSend());
    lastNameController = TextEditingController()..addListener(() => _canSend());
    genderController = TextEditingController()..addListener(() => _canSend());
    ageController = TextEditingController()..addListener(() => _canSend());
  }

  void _canSend() {
    if (detailSection.value == DetailSection.name &&
        firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else if (detailSection.value == DetailSection.username &&
        userNameController.text.trim().isNotEmpty) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else if (detailSection.value == DetailSection.gender &&
        genderController.text.trim().isNotEmpty) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else if (detailSection.value == DetailSection.age &&
        ageController.text.trim().isNotEmpty) {
      buttonState.value = buttonState.value.setCanSend(true);
    } else {
      buttonState.value = buttonState.value.setCanSend(false);
    }
  }

  void performCall() {
    switch (detailSection.value) {
      case DetailSection.name:
        user.firstName = firstNameController.text;
        user.lastName = lastNameController.text;
        detailSection.value = DetailSection.username;
        _canSend();
        break;
      case DetailSection.username:
        user.username = userNameController.text;
        detailSection.value = DetailSection.gender;
        _canSend();
        break;
      case DetailSection.gender:
        user.gender = gender;
        detailSection.value = DetailSection.age;
        _canSend();
        break;
      case DetailSection.age:
        context.replaceNamed(StruggleScreen.name, extra: user.toJson());
        break;
    }
  }

  @override
  void dispose() {
    detailSection.dispose();
    buttonState.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsView(this);
  }
}
