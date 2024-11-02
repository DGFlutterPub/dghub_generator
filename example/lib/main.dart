import './config/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes/routes.dart';
import 'system/services/dghub_services.dart';
import 'system/widgets/scroll/scroll_behavior.dart';

void main() async {
  await DGHubServices.init(onSplashing: () async {
    //CALL YOUR AWAIT DATA
  });

  runApp(
      UncontrolledProviderScope(container: globalRef, child: const DGHubApp()));
}

class DGHubApp extends StatelessWidget {
  const DGHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: Consumer(builder: (context, ref, child) {
      return MaterialApp.router(
        routerConfig: routes,
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
