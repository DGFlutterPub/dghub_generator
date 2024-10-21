import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/global.dart';
import 'routes/routes.dart';
import 'system/widgets/scroll/scroll_behavior.dart';
import 'package:url_strategy/url_strategy.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EncryptedSharedPreferences.initialize(secertKey.substring(0, 15));

  if (kIsWeb) setPathUrlStrategy();

  runApp(
      UncontrolledProviderScope(container: globalRef, child: const DGHubApp()));
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
