import 'package:instajobs/presentation/auth/auth.dart';
import 'package:instajobs/constants/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const LoginPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const LoginPageInit();
  }
}

class LoginPageInit extends StatelessWidget {
  const LoginPageInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
      child: Builder(builder: (context) {
        return BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Authentication Failure')),
                );
            }
          },
          child: const LoginPageView(),
        );
      }),
    );
  }
}

Future<void> logInWithGoogleRequest(BuildContext context) async =>
    await context.read<LoginCubit>().logInWithGoogle();

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height / 2.5,
            color: Colors.indigo.shade900,
          ),
          const LoginDescription(),
          GoogleLoginButton(
              onTap: () async => await logInWithGoogleRequest(context)),
        ],
      ),
    );
  }
}
