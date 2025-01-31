import 'package:flutter/material.dart';

extension ToolColorExtention on Color {
  bool get isColorDark =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.dark;
}

extension ToolExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  bool get isMobile => MediaQuery.of(this).size.width < 480;

  bool get isTablet =>
      MediaQuery.of(this).size.width < 1100 &&
      MediaQuery.of(this).size.width >= 480;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1100;

  bool get isDarkTheme =>
      Theme.of(this).textTheme.bodyLarge!.color == Colors.white;

  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  double get defaultLabelFontSize => isDesktop
      ? 18
      : isTablet
          ? 16
          : 14;
  double get defaultSublabelFontSize => isDesktop
      ? 16
      : isTablet
          ? 14
          : 12;

  bool get isUnicode => _textSize("က").width == _textSize('က္က').width;

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

class Tools {
  static LinearGradient gradient(List<Color> colors,
      {AlignmentGeometry begin = Alignment.centerLeft,
      AlignmentGeometry end = Alignment.centerRight}) {
    if (colors.isEmpty) {
      return LinearGradient(colors: [Colors.transparent, Colors.transparent]);
    }
    if (colors.length == 1) {
      return LinearGradient(
          begin: begin, end: end, colors: [colors[0], colors[0]]);
    }
    return LinearGradient(begin: begin, end: end, colors: colors);
  }
}
