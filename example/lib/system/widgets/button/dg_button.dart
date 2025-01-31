import 'package:flutter/material.dart';
import 'designs/simple_button.dart';
import 'models/dg_button_config.dart';
export './models/dg_button_config.dart';

enum DGButtonDesigns { simple, circle, line, blur }

class DGHubButton extends StatelessWidget {
  final DGButtonDesigns design;
  final DGButtonConfig config;
  const DGHubButton(
      {required this.config, this.design = DGButtonDesigns.simple, super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      DGButtonDesigns.simple => SimpleButton(
          config: config,
        ),
      _ => SimpleButton(
          config: config,
        ),
    };
  }
}
