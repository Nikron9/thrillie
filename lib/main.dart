import 'package:flutter/material.dart';
import 'package:thrillie/features/launcher/launcher.dart';

void main() {
  runApp(const ThrillieApp());
}

class ThrillieApp extends StatelessWidget {
  const ThrillieApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Thrillie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Launcher(),
    );
}
