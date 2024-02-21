import 'package:therapease/utils/utils.dart';
part 'view.dart';

class ListeningScreen extends StatefulWidget {
  static const path = "/listening";
  static const name = "listening";
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => ListeningController();
}

class ListeningController extends State<ListeningScreen> {
  @override
  Widget build(BuildContext context) {
    return ListeningView(this);
  }
}
