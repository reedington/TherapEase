enum ButtonIconPosition { left, right }

enum AppBrightness { systemDark, systemLight, dark, light, none }

enum RecoveryTabType { live, upcoming }

enum Gender {
  male,
  female;

  factory Gender.fromString(String word) {
    return switch (word) {
      'male' => Gender.male,
      _ => Gender.female,
    };
  }

  @override
  String toString() {
    return name;
  }
}
