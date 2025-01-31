import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../tools/tools.dart';
import '../../border/gradient_box_border.dart';
import '../models/dg_button_config.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

class SimpleButton extends StatefulWidget {
  final DGButtonConfig config;
  const SimpleButton({required this.config, super.key});

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: widget.config.margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.config.radius),
        child: shimmer.Shimmer(
          enabled: widget.config.shimmer,
          gradient: LinearGradient(
              colors: context.isDarkTheme
                  ? [Colors.white, Colors.white]
                  : [Colors.black, Colors.black]),
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.config.radius),
            onTap: widget.config.isLoading || !widget.config.enabled
                ? null
                : widget.config.onTap,
            child: Container(
              alignment: Alignment.center,
              padding: widget.config.padding,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.config.radius),
                  border: widget.config.lineMode
                      ? GradientBoxBorder(
                          width: 3,
                          gradient: Tools.gradient(
                              widget.config.colors ?? [theme.primaryColor]))
                      : null,
                  gradient: widget.config.lineMode
                      ? null
                      : Tools.gradient(
                          widget.config.colors ?? [theme.primaryColor])),
              width: widget.config.width,
              height: widget.config.height,
              child: widget.config.isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballPulse,
                        colors:
                            (widget.config.colors?.first ?? theme.primaryColor)
                                    .isColorDark
                                ? [Colors.white]
                                : [Colors.black],
                        strokeWidth: 2,
                      ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.config.icon != null) widget.config.icon!,
                        if (widget.config.icon != null)
                          const SizedBox(
                            width: 5,
                          ),
                        Text(
                          widget.config.isError
                              ? widget.config.errorLabel ??
                                  'Try again'.toUpperCase()
                              : widget.config.label?.toUpperCase() ?? '',
                          style: TextStyle(
                              color: widget.config.enabled
                                  ? (widget.config.colors?.first ??
                                              theme.primaryColor)
                                          .isColorDark
                                      ? Colors.white
                                      : Colors.black
                                  : Colors.grey,
                              fontSize: widget.config.labelSize),
                          maxLines: 1,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
