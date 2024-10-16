import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes/routes.dart';
import 'system/widgets/scroll/scroll_behavior.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  var ref = ProviderContainer();

  runApp(UncontrolledProviderScope(container: ref, child: const DGHubApp()));
}

class DGHubApp extends StatelessWidget {
  const DGHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: Consumer(builder: (context, ref, child) {
      final routes = Routes(ref: ref);
      return MaterialApp.router(
        routerConfig: routes.config(),
        scrollBehavior: DGHubScrollBehavior.scrollBehavior(),
        builder: (context, child) {
          return DGHubScrollBehavior.scrollBuilderWidget(child: child);
        },
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          useMaterial3: true,
        ),
        //themeMode: themeMode,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
      );
    }));
  }
}
