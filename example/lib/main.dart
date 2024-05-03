import 'package:example/config/providers.dart';
import 'system/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:dghub_generator/dghub_generator.dart';

import 'system/language/language_provider.dart';

void main() {
  runApp(const DGHubApp());
}

class DGHubApp extends StatelessWidget {
  const DGHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.get(),
      child: Consumer<ThemeProvider>(
          builder: (themeContext, themeProvider, themeChild) {
        return Consumer<LanguageProvider>(
            builder: (languageContext, languageProvider, languageChild) {
          return MaterialApp.router(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        });
      }),
    );
  }
}
