import 'package:flutter/cupertino.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';

class CreateNexusScreen extends StatefulWidget {
  static const path = "/create_nexus";
  static const name = "create_nexus";
  const CreateNexusScreen({super.key});

  @override
  State<CreateNexusScreen> createState() => CreateNexusController();
}

class CreateNexusController extends State<CreateNexusScreen> {
  @override
  Widget build(BuildContext context) {
    return CreateNexusView(this);
  }
}
