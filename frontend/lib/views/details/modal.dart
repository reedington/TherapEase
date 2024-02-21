part of 'controller.dart';

class DetailsModal {
  static Future<Gender?> showGenderBottomSheet(BuildContext context) async {
    return showModalBottomSheet<Gender?>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Male'),
              onTap: () => context.popTo(
                Gender.male,
              ),
            ),
            ListTile(
              title: const Text('Female'),
              onTap: () => context.popTo(
                Gender.female,
              ),
            ),
            50.verticalSpace,
          ],
        );
      },
    );
  }
}
