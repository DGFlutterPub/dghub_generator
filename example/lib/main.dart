import 'package:example/system/scroll/scroll_behavior.dart';
import 'package:example/system/theme/theme_controller.dart';
import 'package:example/system/theme/theme_controller_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DGHubApp());
}

class DGHubApp extends StatelessWidget {
  const DGHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _routes = Routes();
    return ProviderScope(
      child: ThemeControllerWidget(builder: (themeController, themeMode) {
        print(themeMode);
        return MaterialApp.router(
          routerConfig: _routes.config(),
          scrollBehavior: DGHubScrollBehavior.scrollBehavior(),
          builder: (context, child) {
            return DGHubScrollBehavior.scrollBuilderWidget(child: child);
          },
          darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            useMaterial3: true,
          ),
          themeMode: themeMode,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
        );
      }),
    );
  }
}
