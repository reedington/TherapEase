import 'package:flutter/cupertino.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';

class MainScreen extends StatefulWidget {
  static const path = "/main";
  static const name = "main";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainController();
}

class MainController extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MainView(this);
  }
}
