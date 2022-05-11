import 'package:flutter/cupertino.dart';
import 'package:instajobs/config/config.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/main_initializer.dart';
import 'package:instajobs/presentation/messages/blocs/blocs.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(0, 120);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    final String userID = user.id;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HomeAppBarButton(
        width: _width,
        onPressed: () {
          context.read<MessagesBloc>().add(LoadMessages(userID));
          context.read<NavigationCubit>().showProfile(true);
        },
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(
            CupertinoIcons.person_fill,
            size: 30,
            color: Theme.of(context).iconTheme.color,
          ),
          elevation: 0.0,
          title: Text(
            user.name!,
            style: TextStyle(
              color: Theme.of(context).hintColor,
              wordSpacing: 1,
              letterSpacing: 0.6,
            ),
          ),
          actions: [
            Icon(
              Icons.menu,
              size: _width / 12,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAppBarButton extends ElevatedButton {
  HomeAppBarButton({
    required VoidCallback? onPressed,
    required Widget child,
    Key? key,
    required double width,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.indigo.shade900),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(EdgeInsets.all(width / 20)),
            elevation: MaterialStateProperty.all(0.0),
          ),
        );
}
