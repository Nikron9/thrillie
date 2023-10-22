import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:l0_data/firebase/services/i_firebase_service.dart';
import 'package:thrillie/di.dart';
import 'package:thrillie/navigation/app_router.dart';

Future main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  DI().setUp();

  await DI.instance.get<IFirebaseService>().initializeApp();

  runApp(const ThrillieApp());
}

class ThrillieApp extends StatelessWidget {
  const ThrillieApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = DI.instance.get<AppRouter>();

    return MaterialApp.router(
      title: 'Thrillie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
