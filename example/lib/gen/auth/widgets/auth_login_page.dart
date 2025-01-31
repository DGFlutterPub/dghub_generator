import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthLoginPage extends ConsumerStatefulWidget {
  const AuthLoginPage({super.key});
  @override
  ConsumerState<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends ConsumerState<AuthLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AuthLoginFormWidget()),
        Expanded(child: AuthLoginBanner())
      ],
    );
  }
}

class AuthLoginBanner extends StatelessWidget {
  const AuthLoginBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AuthLoginFormWidget extends StatelessWidget {
  const AuthLoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
