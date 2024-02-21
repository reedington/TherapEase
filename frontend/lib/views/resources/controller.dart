import 'package:therapease/utils/utils.dart';
part 'view.dart';
part 'resource_detail.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => ResourcesController();
}

class ResourcesController extends State<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return ResourcesView(this);
  }
}
