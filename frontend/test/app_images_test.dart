import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:therapease/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.face).existsSync(), true);
    expect(File(AppImages.logoText).existsSync(), true);
    expect(File(AppImages.logo).existsSync(), true);
    expect(File(AppImages.onboarding).existsSync(), true);
  });
}
