import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/dg_text_field_config.dart';

class CardTextField extends StatefulWidget {
  final DGTextFieldConfig config;
  const CardTextField({required this.config, super.key});

  @override
  State<CardTextField> createState() => _CardTextFieldState();
}

class _CardTextFieldState extends State<CardTextField> {
  late bool isPasswordModeChanger;

  @override
  void initState() {
    isPasswordModeChanger = widget.config.isPasswordMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double borderR = 15;

    return Container(
      margin: widget.config.margin,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: widget.config.onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderR),
              color: theme.cardColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.config.label ?? widget.config.hint,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextField(
                obscureText: isPasswordModeChanger,
                enabled: widget.config.enabled,
                maxLength: widget.config.maxLength,
                keyboardType: widget.config.textInputType,
                inputFormatters: [
                  if (widget.config.isDigitMode)
                    FilteringTextInputFormatter.digitsOnly,
                  if (widget.config.isPhoneMode)
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  if (widget.config.isPhoneMode)
                    FilteringTextInputFormatter.deny(RegExp(r'^0+'))
                ],

                maxLines: widget.config.maxLine ?? 1,
                obscuringCharacter: "*",
                controller: widget.config.controller,
                style: const TextStyle(fontSize: 12),
                // obscureText: true,
                decoration: InputDecoration(
                    prefixIconConstraints: const BoxConstraints(),
                    prefixStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                    prefix: widget.config.countryCode == null
                        ? null
                        : Wrap(
                            direction: Axis.vertical,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Row(
                                    children: [
                                      Text(widget.config.countryCode!),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        '|',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                    errorStyle: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    prefixIcon: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: widget.config.leftWidget),
                    suffixIcon: widget.config.isPasswordMode
                        ? GestureDetector(
                            onTap: widget.config.isPasswordMode
                                ? () => setState(() {
                                      isPasswordModeChanger =
                                          !isPasswordModeChanger;
                                    })
                                : null,
                            child: Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: isPasswordModeChanger
                                    ? const Icon(Icons.visibility,
                                        color: Colors.grey, size: 15)
                                    : const Icon(Icons.visibility_off,
                                        color: Colors.grey, size: 15)))
                        : widget.config.rightWidget,
                    // labelText: widget.config.label,
                    floatingLabelStyle: TextStyle(color: theme.primaryColor),
                    labelStyle: const TextStyle(color: Colors.grey),
                    hintStyle:
                        const TextStyle(fontSize: 12.0, color: Colors.grey),
                    hintText: widget.config.hint),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
