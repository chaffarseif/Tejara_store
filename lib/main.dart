import 'package:tejara_store/core/config/firebase_config.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:tejara_store/core/config/global_config.dart';
import 'package:tejara_store/core/routing/routers/app_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: FirebaseConfig.options);
  await FirebaseAppCheck.instance.activate(
    providerAndroid: FirebaseConfig.providerAndroid,
    providerApple: FirebaseConfig.providerApple,
  );
}

// Future<void> initGoogleSignIn() async {
//   GoogleSignIn.instance.initialize();
// }

Future<void> initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConcurrentFutures.executeList([initFirebase()]);
}

void main() async {
  await initProject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tejara Store',
      theme: TejaraTheme.lightTheme,
      darkTheme: TejaraTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter.config(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      supportedLocales: const [Locale('fr')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
