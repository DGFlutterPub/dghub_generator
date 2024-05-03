import 'package:example/config/extentions.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.gen().auth.validator.checkModel();
    return Container();
  }
}
