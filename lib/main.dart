import 'package:finance_ai/ui/core/themes/theme.dart';

import 'routing/router.dart';
import 'package:flutter/material.dart';

import 'main_development.dart' as development;

void main() {
  // Launch development config by default
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: router(),
    );
  }
}
