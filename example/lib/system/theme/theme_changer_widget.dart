import 'package:example/system/theme/theme_scope.dart';
import 'package:flutter/material.dart';

class ThemeChangerWidget extends StatelessWidget {
  final Widget darkChild;
  final Widget lightChild;
  final Widget systemChild;
  final double space;
  const ThemeChangerWidget(
      {required this.darkChild,
      required this.lightChild,
      required this.systemChild,
      this.space = 5,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeScope(builder: (read, watch) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              read.change(ThemeMode.system);
            },
            child: systemChild,
          ),
          SizedBox(height: space),
          GestureDetector(
            onTap: () {
              read.change(ThemeMode.light);
            },
            child: lightChild,
          ),
          SizedBox(height: space),
          GestureDetector(
            onTap: () {
              read.change(ThemeMode.dark);
            },
            child: darkChild,
          ),
        ],
      );
    });
  }
}
