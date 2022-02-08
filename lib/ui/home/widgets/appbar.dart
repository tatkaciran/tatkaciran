import 'package:flutter/cupertino.dart';
import 'package:instajobs/config/config.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/ui/auth/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:instajobs/ui/messages/blocs/blocs.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => HomeAppBarWidgets.preferredSize;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    final String userID = context.watch<AuthenticationBloc>().state.user.id;

    return ElevatedButton(
      style: HomeAppBarWidgets.buttonStyle(_width),
      onPressed: () {
        context.read<MessagesBloc>().add(LoadMessages(userID));
        context
            .read<NavigationBloc>()
            .add(const NavigationEvent.showProfile(true));
      },
      child: AppBar(
        backgroundColor: HomeAppBarWidgets.appBarColor,
        leading: HomeAppBarWidgets.buildAtavar(context),
        elevation: HomeAppBarWidgets.elevation,
        title: HomeAppBarWidgets.buildUsername(context),
        actions: [
          HomeAppBarWidgets.buildMenuIcon(_width, context),
        ],
      ),
    );
  }
}

class HomeAppBarWidgets {
  static Size get preferredSize => const Size(0, 95);

  static const Color _highlightColor = Color.fromRGBO(3, 23, 56, 1);
  static const Color appBarColor = Colors.transparent;
  static const double elevation = 0.0;

  static ButtonStyle buttonStyle(double width) {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(_highlightColor),
      backgroundColor: MaterialStateProperty.all(appBarColor),
      padding: MaterialStateProperty.all(HomeAppBarWidgets.padding(width)),
      elevation: MaterialStateProperty.all(elevation),
    );
  }

  static Text buildUsername(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Text(
      user.name!,
      style: TextStyle(
        color: Theme.of(context).hintColor,
        wordSpacing: 1,
        letterSpacing: 0.6,
      ),
    );
  }

  static Icon buildMenuIcon(double _width, BuildContext context) {
    return Icon(
      Icons.menu,
      size: _width / 12,
      color: Theme.of(context).iconTheme.color,
    );
  }

  static EdgeInsets padding(double width) {
    return EdgeInsets.only(
      left: width / 20,
      right: width / 20,
      top: width / 15,
    );
  }

  static Icon buildAtavar(BuildContext context) {
    return Icon(
      CupertinoIcons.person_fill,
      size: 30,
      color: Theme.of(context).iconTheme.color,
    );
  }
}
