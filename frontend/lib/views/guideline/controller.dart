import 'package:avatar_glow/avatar_glow.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';

class GuidelineScreen extends StatefulWidget {
  static const path = "/Guideline";
  static const name = "Guideline";
  const GuidelineScreen({super.key});

  @override
  State<GuidelineScreen> createState() => GuidelineController();
}

class GuidelineController extends State<GuidelineScreen> {
  var terms = [
    "Accept terms to continue:",
    "Empathy and Understanding:",
    "Support, Not Advice:",
    "Mindful Language:",
    "No Promotions or Solicitations:",
    "Respect Boundaries:",
    "Positive and Constructive:",
  ];
  @override
  Widget build(BuildContext context) {
    return GuidelineView(this);
  }
}
