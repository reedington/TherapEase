import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:therapease/resources/resources.dart';

void main() {
  test('app_svg assets test', () {
    expect(File(AppSvg.alertCircle).existsSync(), true);
    expect(File(AppSvg.apple).existsSync(), true);
    expect(File(AppSvg.audioWave).existsSync(), true);
    expect(File(AppSvg.bellAlert).existsSync(), true);
    expect(File(AppSvg.bookOpen).existsSync(), true);
    expect(File(AppSvg.calendar).existsSync(), true);
    expect(File(AppSvg.chevronRight).existsSync(), true);
    expect(File(AppSvg.clock).existsSync(), true);
    expect(File(AppSvg.eyeClose).existsSync(), true);
    expect(File(AppSvg.eye).existsSync(), true);
    expect(File(AppSvg.facebook).existsSync(), true);
    expect(File(AppSvg.google).existsSync(), true);
    expect(File(AppSvg.home).existsSync(), true);
    expect(File(AppSvg.logo).existsSync(), true);
    expect(File(AppSvg.micOff).existsSync(), true);
    expect(File(AppSvg.microphone).existsSync(), true);
    expect(File(AppSvg.physicalTherapy).existsSync(), true);
    expect(File(AppSvg.success).existsSync(), true);
    expect(File(AppSvg.userGroup).existsSync(), true);
    expect(File(AppSvg.users).existsSync(), true);
    expect(File(AppSvg.xMark).existsSync(), true);
  });
}
