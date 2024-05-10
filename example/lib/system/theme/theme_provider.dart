import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends Notifier<ThemeMode> {
  @override
  build() {
    return ThemeMode.system;
  }

  change(ThemeMode t) {
    return state = t;
  }
}
