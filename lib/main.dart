import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/providers/theme.dart';
import 'package:matjarcom/screens/main_acreens/home/introduction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:matjarcom/services/Theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar', 'JO'), Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider themeProvider, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: tr('MatjarCom'),
            theme: themeProvider.isDarkThemeOn
                ? AppTheme.buildDarkTheme()
                : AppTheme.buildLightTheme(),
            debugShowCheckedModeBanner: false,
            routes: routes,
            initialRoute: Introduction.id,
          ),
        ));
  }
}
