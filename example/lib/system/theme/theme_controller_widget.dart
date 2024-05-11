import 'package:example/system/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var p = NotifierProvider<ThemeController, ThemeMode>(() => ThemeController());

class ThemeControllerWidget extends ConsumerWidget {
  final Widget Function(ThemeController provider, ThemeMode data) builder;
  const ThemeControllerWidget({required this.builder, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var w = ref.watch(p);
    var r = ref.read(p.notifier);
    return builder(r, w);
  }
}
