import 'package:finance_ai/config/dependencies.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
/// Uses local data.
Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: providersLocal,
      child: const MainApp(),
    ),
  );
}
