import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:resume_maker/lang/app_lang.dart';
import 'package:resume_maker/route/get_router.dart';
import 'package:resume_maker/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.loadTranslations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: '',
            theme: Apptheme().lightTheme,
            darkTheme: Apptheme().darkTheme,
            themeMode: ThemeMode.light,
            translations: TranslationService(),
            locale: const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),
            getPages: getRouter,
            initialRoute: '/',
            defaultTransition: Transition.cupertino,
            builder: (BuildContext context, child) {
              child = botToastBuilder(context, child);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.noScaling,
                ),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
