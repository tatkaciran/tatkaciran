import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/presentation/auth/auth.dart';

class GoogleLoginButton extends LoginButton {
  const GoogleLoginButton({
    Key? key,
    required Function()? onTap,
  }) : super(
          onTap: onTap,
          key: key,
          icon: FontAwesomeIcons.google,
        );
}

class LoginButton extends StatefulWidget {
  final Function()? onTap;
  final Duration duration;
  final IconData icon;
  final Color iconColor;
  final Color buttonColor;
  final double buttonSize;

  const LoginButton({
    Key? key,
    required this.onTap,
    this.duration = const Duration(milliseconds: 800),
    this.icon = Icons.abc,
    this.buttonSize = 2.9,
    this.iconColor = Colors.blue,
    this.buttonColor = Colors.white,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final Tween<double> _logoSizeRange = Tween<double>(begin: 130, end: 140);

  void animationListener() {
    setState(() {});
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  void controllerInit() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..forward();
  }

  void animationInit() {
    animation = _logoSizeRange.animate(controller)
      ..addListener(animationListener)
      ..addStatusListener(animationStatusListener);
  }

  @override
  void initState() {
    controllerInit();
    animationInit();
    super.initState();
  }

  @override
  void dispose() {
    animation.removeListener(animationListener);
    animation.removeStatusListener(animationStatusListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double animationDouble = animation.value;
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(90)),
        child: SizedBox(
          height: width / widget.buttonSize,
          width: width / widget.buttonSize,
          child: ColoredBox(
            color: widget.buttonColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: AnimatedScale(
                scale: (animationDouble * 2) / width,
                curve: Curves.slowMiddle,
                duration: Duration.zero,
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: width / widget.buttonSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
