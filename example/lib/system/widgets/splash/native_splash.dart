import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class NativeSplash {
  static const MethodChannel _channel = MethodChannel('native_splash');

  static WidgetsBinding? _widgetsBinding;

  // Prevents app from closing splash screen, app layout will be build but not displayed.
  static void start({required WidgetsBinding widgetsBinding}) {
    _widgetsBinding = widgetsBinding;
    _widgetsBinding?.deferFirstFrame();
  }

  static void close() {
    _widgetsBinding?.allowFirstFrame();
    _widgetsBinding = null;
    if (kIsWeb) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        try {
          _channel.invokeMethod('remove');
        } catch (e) {
          throw Exception(
            '${e}Splash error"?',
          );
        }
      });
    }
  }
}
