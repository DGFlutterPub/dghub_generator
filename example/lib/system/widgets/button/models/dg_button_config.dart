import 'package:flutter/widgets.dart';

class DGButtonConfig {
  bool shimmer;
  bool isLoading;
  bool isError;
  bool isSuccess;
  String? label;
  String? errorLabel;
  String? successLabel;
  double? width;
  double? height;
  EdgeInsets? margin;
  double radius;
  double? elevation;
  Function() onTap;
  EdgeInsets? padding;
  List<Color>? colors;
  double labelSize;
  Widget? icon;
  double iconSize;
  bool enabled;
  bool lineMode;
  DGButtonConfig(
      {this.successLabel,
      this.errorLabel,
      this.shimmer = false,
      this.labelSize = 12,
      this.colors,
      this.elevation,
      this.radius = 100,
      this.margin,
      this.padding = const EdgeInsets.fromLTRB(15, 10, 15, 10),
      this.height,
      this.lineMode = false,
      this.width,
      this.isError = false,
      this.isLoading = false,
      this.isSuccess = false,
      required this.onTap,
      this.enabled = true,
      this.icon,
      this.iconSize = 25,
      this.label});
}
