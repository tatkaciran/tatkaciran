import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/ui/auth/auth.dart';

class GoogleLoginButton extends StatefulWidget {
  const GoogleLoginButton({Key? key}) : super(key: key);

  @override
  _GoogleLoginButtonState createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation = Tween<double>(begin: 120, end: 145).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double animationDouble = animation.value;
    return GestureDetector(
      onTap: () {
        context.read<LoginCubit>().logInWithGoogle();
      },
      child: ClipOval(
        child: SizedBox(
          height: width / 2.9,
          width: width / 2.9,
          child: ColoredBox(
            color: Colors.white,
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.blue,
              size: animationDouble / 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
