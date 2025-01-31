import 'package:flutter/material.dart';
import 'designs/card_text_field.dart';
import 'designs/simple_text_field.dart';
import 'models/dg_text_field_config.dart';
export './models/dg_text_field_config.dart';

enum DGTextFieldDesign { simple, card }

class DGTextField extends StatelessWidget {
  final DGTextFieldDesign design;
  final DGTextFieldConfig config;
  const DGTextField(
      {required this.config,
      this.design = DGTextFieldDesign.simple,
      super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      DGTextFieldDesign.card => CardTextField(
          config: config,
        ),
      DGTextFieldDesign.simple => SimpleTextField(
          config: config,
        )
    };
  }
}
