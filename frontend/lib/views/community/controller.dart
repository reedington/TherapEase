import 'package:avatar_stack/avatar_stack.dart';
import 'package:therapease/utils/utils.dart';
part 'view.dart';
part 'modal.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => CommunityController();
}

class CommunityController extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return CommunityView(this);
  }
}
