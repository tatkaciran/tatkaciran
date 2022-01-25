import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';
import 'package:instajobs/ui/auth/auth.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context
          .read<AuthenticationBloc>()
          .add(AuthenticationLogoutRequested()),
      title: Text(context.l10n!.logOutText),
      trailing: const Icon(Icons.exit_to_app),
    );
  }
}
