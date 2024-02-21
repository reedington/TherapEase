import 'package:therapease/utils/utils.dart';
part 'view.dart';
part 'ui_model.dart';

class OnboardingScreen extends StatefulWidget {
  static const path = "/onboarding";
  static const name = "onboarding";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingController();
}

class OnboardingController extends State<OnboardingScreen> {
  late PageController pageController;
  var index = ValueNotifier(0);
  List<OnboardingDisplay> display = [
    OnboardingDisplay(
      desciption:
          'Take control of your well-being with powerful tools and resources.',
      text: 'Empower',
    ),
    OnboardingDisplay(
      desciption:
          'Share experiences within a supportive community and finding solace together.',
      text: 'Connect',
    ),
    OnboardingDisplay(
      desciption:
          'Thrive and flourish within a caring community, achieving personal growth and balance.',
      text: 'Thrive',
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingView(this);
  }
}
