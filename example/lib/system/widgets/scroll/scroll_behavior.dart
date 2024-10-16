import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class _DGHubScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _AppBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class DGHubScrollBehavior {
  static scrollBehavior() => _DGHubScrollBehavior();
  static scrollBuilderWidget({required Widget? child}) => ScrollConfiguration(
      behavior: _AppBehavior(), child: child ?? const Material());
}
