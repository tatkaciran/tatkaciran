import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/ui/auth/auth.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(color: Colors.white, height: height / 3),
            const LoginDescription(),
            const GoogleLoginButton(),
          ],
        ),
      ),
    );
  }
}
