// import 'package:therapease/utils/utils.dart';

// class CustomTheme extends ThemeExtension<CustomTheme> {
//   final String hd;
//   final String language;
//   final String lock;
//   final String pausePlay;
//   final String privacy;
//   final String rate;
//   final String speed;
//   final String text;
//   final String theme;
//   final String timer;
//   final String trash;
//   final String feedback;
//   final String chevronRight;
//   final Brightness brightness;

//   CustomTheme({
//     required this.hd,
//     required this.language,
//     required this.lock,
//     required this.pausePlay,
//     required this.privacy,
//     required this.rate,
//     required this.speed,
//     required this.text,
//     required this.theme,
//     required this.timer,
//     required this.trash,
//     required this.chevronRight,
//     required this.feedback,
//     required this.brightness,
//   });

//   @override
//   ThemeExtension<CustomTheme> copyWith() {
//     return CustomTheme(
//       hd: hd,
//       language: language,
//       lock: lock,
//       pausePlay: pausePlay,
//       privacy: privacy,
//       rate: rate,
//       speed: speed,
//       text: text,
//       theme: theme,
//       timer: timer,
//       trash: trash,
//       feedback: feedback,
//       chevronRight: chevronRight,
//       brightness: brightness,
//     );
//   }

//   @override
//   CustomTheme lerp(ThemeExtension<CustomTheme> other, double t) {
//     if (other is! CustomTheme) {
//       return this;
//     }
//     return CustomTheme(
//       hd: other.hd,
//       language: other.language,
//       lock: other.lock,
//       pausePlay: other.pausePlay,
//       privacy: other.privacy,
//       rate: other.rate,
//       speed: other.speed,
//       text: other.text,
//       theme: other.theme,
//       timer: other.timer,
//       trash: other.trash,
//       feedback: other.feedback,
//       chevronRight: other.chevronRight,
//       brightness: other.brightness,
//     );
//   }
// }

// class AppTheme {
//   static final AppTheme instance = AppTheme._init();
//   AppTheme._init();

//   final ThemeData darkTheme = ThemeData(
//     useMaterial3: false,
//     brightness: Brightness.dark,
//     fontFamily: 'Inter',
//     listTileTheme: ListTileThemeData(
//       minLeadingWidth: 0,
//       tileColor: AppColor.gray,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//     ),
//     scaffoldBackgroundColor: AppColor.gray60,
//     tabBarTheme: TabBarTheme(
//       indicatorColor: AppColor.white,
//       labelStyle: TextStyle(
//         fontSize: 14.sp,
//         fontWeight: FontWeight.w700,
//         color: AppColor.white,
//       ),
//       unselectedLabelStyle: TextStyle(
//         fontSize: 14.sp,
//         fontWeight: FontWeight.w400,
//         color: AppColor.white,
//       ),
//     ),
//     appBarTheme: AppBarTheme(
//       elevation: 0,
//       backgroundColor: AppColor.gray60,
//       titleTextStyle: TextStyle(
//         color: AppColor.white,
//         fontWeight: FontWeight.w600,
//         fontSize: 20.sp,
//       ),
//     ),
//     extensions: [
//       CustomTheme(
//         hd: AppSvg.hdDark,
//         language: AppSvg.languageDark,
//         lock: AppSvg.lockDark,
//         pausePlay: AppSvg.pausePlayDark,
//         privacy: AppSvg.privacyDark,
//         rate: AppSvg.rateDark,
//         speed: AppSvg.speedDark,
//         text: AppSvg.textDark,
//         theme: AppSvg.themeDark,
//         timer: AppSvg.timerDark,
//         trash: AppSvg.trashDark,
//         chevronRight: AppSvg.chevronRightDark,
//         feedback: AppSvg.feedbackDark,
//         brightness: Brightness.dark,
//       ),
//     ],
//   );

//   final ThemeData lightTheme = ThemeData(
//     useMaterial3: false,
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: AppColor.white,
//     fontFamily: 'Inter',
//     listTileTheme: ListTileThemeData(
//       minLeadingWidth: 0,
//       tileColor: AppColor.gray10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//     ),
//     tabBarTheme: TabBarTheme(
//       indicatorColor: AppColor.gray100,
//       labelStyle: TextStyle(
//         fontSize: 14.sp,
//         fontWeight: FontWeight.w700,
//         color: AppColor.gray100,
//       ),
//       unselectedLabelStyle: TextStyle(
//         fontSize: 14.sp,
//         fontWeight: FontWeight.w400,
//         color: AppColor.gray100,
//       ),
//     ),
//     appBarTheme: AppBarTheme(
//       elevation: 0,
//       backgroundColor: AppColor.white,
//       titleTextStyle: TextStyle(
//         color: AppColor.gray100,
//         fontWeight: FontWeight.w600,
//         fontSize: 20.sp,
//       ),
//     ),
//     extensions: [
//       CustomTheme(
//         hd: AppSvg.hdLight,
//         language: AppSvg.languageLight,
//         lock: AppSvg.languageLight,
//         pausePlay: AppSvg.pausePlayLight,
//         privacy: AppSvg.privacyLight,
//         rate: AppSvg.rateLight,
//         speed: AppSvg.speedLight,
//         text: AppSvg.textLight,
//         theme: AppSvg.themeLight,
//         timer: AppSvg.timerLight,
//         trash: AppSvg.trashLight,
//         chevronRight: AppSvg.chevronRightLight,
//         feedback: AppSvg.feedbackLight,
//         brightness: Brightness.light,
//       ),
//     ],
//   );
// }
