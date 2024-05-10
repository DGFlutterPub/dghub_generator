import 'package:example/system/theme/theme_changer_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemeChangerWidget(
          darkChild: Text('Dark'),
          lightChild: Text('Light'),
          systemChild: Text('System')),
    );
  }
}
