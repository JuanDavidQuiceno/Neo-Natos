import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/global_locator.dart';
import 'src/observer_bloc.dart';
import 'src/theme/theme.dart';
import 'src/ui/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ObserverBloc();
  setUpGlobalLocator();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _logger = global<Logger>();

  @override
  void initState() {
    if (!kReleaseMode) {
      _logger.wtf('App started');
      // _logger.wtf('Token fcm: ${LocalStorage.tokenFcm}');
    }
    // FirebaseService.messageStream.listen((event) {
    //   if (!kReleaseMode) {
    //     _logger.wtf(
    //         'message: => title: ${event.notification?.title}, body: ${event.notification?.body}');
    //   }
    //   LocalNotificationServices().showNotification(
    //       title: event.notification!.title, body: event.notification?.body);

    //   // LocalNotificationServices().showNotificacion();
    // });
    // FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoNatos',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      home: const SplashScreen(),
      // scaffoldMessengerKey: NotificationServices.messegerKey,
      theme: lightThemeData,
      // darkTheme: darkThemeData,
      // themeMode: EasyDynamicTheme.of(context).themeMode,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'ES'), // Español
        Locale('en', 'EN'), // Inglés
      ],
      locale: const Locale('es', 'ES'),
    );
  }
}
