import 'package:therapease/utils/utils.dart';
part 'view.dart';
part 'widget.dart';

class IntroScreen extends StatefulWidget {
  static const path = "/intro";
  static const name = "intro";
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => IntroController();
}

class IntroController extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroView(this);
  }
}
