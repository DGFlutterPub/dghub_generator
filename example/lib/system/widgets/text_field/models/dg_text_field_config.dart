import 'package:flutter/material.dart';

class DGTextFieldConfig {
  String? label;
  String hint;
  String? errorLabel;
  String? countryCode;
  bool isPhoneMode;
  bool isPasswordMode;
  bool isDigitMode;
  bool isDoubleMode;
  Widget? leftWidget;
  Widget? rightWidget;
  Function()? onTap;
  EdgeInsets? margin;
  bool enabled;
  int? maxLength;
  TextInputType? textInputType;
  TextEditingController controller;
  int? maxLine;
  Color? backgroundColor;
  DGTextFieldConfig(
      {this.label,
      required this.hint,
      this.errorLabel,
      this.leftWidget,
      this.isDigitMode = false,
      this.isPasswordMode = false,
      this.isPhoneMode = false,
      this.isDoubleMode = false,
      this.rightWidget,
      required this.controller,
      this.enabled = true,
      this.margin,
      this.onTap,
      this.maxLength,
      this.textInputType,
      this.maxLine,
      this.backgroundColor,
      this.countryCode});
}
