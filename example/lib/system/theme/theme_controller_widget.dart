import 'package:example/system/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var provider =
    NotifierProvider<ThemeController, ThemeMode>(() => ThemeController());

class ThemeControllerWidget extends ConsumerWidget {
  final Widget Function(ThemeController provider, ThemeMode data) builder;
  const ThemeControllerWidget({required this.builder, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var w = ref.watch(provider);
    var r = ref.read(provider.notifier);
    return builder(r, w);
  }
}
