import 'package:dghub_generator/dghub_generator.dart';
import 'package:example/system/language/language_provider.dart';
import '../system/theme/theme_provider.dart';

class Providers {
  static List<SingleChildWidget> get() => [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider())
      ];
}
