import 'package:firebase_core/firebase_core.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:therapease/firebase_options.dart';
import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalStorage.instance.initialise();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: AppTexts.telecue,
          routerConfig: routes,
          builder: (context, child) => KeyboardDismisser(
            gestures: const [
              GestureType.onTap,
              GestureType.onVerticalDragDown,
            ],
            child: child!,
          ),
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: AppColor.scaffoldColor,
            ),
            scaffoldBackgroundColor: AppColor.scaffoldColor,
            fontFamily: AppConstant.fontFamily,
            primaryColor: AppColor.brandColor,
            checkboxTheme: CheckboxThemeData(
              fillColor: MaterialStateColor.resolveWith(
                (states) => AppColor.brandColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
