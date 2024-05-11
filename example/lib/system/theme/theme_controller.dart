import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/internal.dart';
import 'package:objectbox/objectbox.dart';

class ThemeController extends Notifier<ThemeMode> {
  @override
  build() {
    return ThemeMode.system;
  }

  change(ThemeMode t) {
    return state = t;
  }
}
