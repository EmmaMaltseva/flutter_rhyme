import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/router/router.dart';
import 'package:flutter_project/ui/ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //для запуска ассинхронных операций до запуска приложения
  await dotenv.load(fileName: ".env");
  final apiUrl = dotenv.env['API_URL'];
  runApp(const RhymerApp());
}

class RhymerApp extends StatefulWidget {
  const RhymerApp({super.key});

  @override
  State<RhymerApp> createState() => _RhymerAppState();
}

class _RhymerAppState extends State<RhymerApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rhymer',
      //конструктор
      theme: themeData,
      routerConfig: _router.config(),
    );
  }
}
