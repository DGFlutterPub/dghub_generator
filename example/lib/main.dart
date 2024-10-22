import 'package:dghub/config/global.dart';
import 'package:dghub/system/services/background_services.dart';
import 'package:dghub/system/services/notification_services.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';
import 'routes/routes.dart';
import 'system/widgets/scroll/scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EncryptedSharedPreferences.initialize(secertKey.substring(0, 15));

  // await NotificationService().init();

  if (kIsWeb) {
    setPathUrlStrategy();
  } else {
    // await BackgroundService.init();
  }

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
