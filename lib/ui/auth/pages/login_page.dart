import 'package:flutter/material.dart';
import 'package:instajobs/ui/auth/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const LoginPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: BlocProvider(
        create: (_) => LoginCubit(
          context.read<AuthenticationRepository>(),
        ),
        child: const LoginForm(),
      ),
    );
  }
}
