import 'package:example/system/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var provider =
    NotifierProvider<ThemeProvider, ThemeMode>(() => ThemeProvider());

class ThemeScope extends ConsumerWidget {
  final Widget Function(ThemeProvider provider, ThemeMode data) builder;
  const ThemeScope({required this.builder, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return builder(ref.read(provider.notifier), ref.watch(provider));
  }
}
