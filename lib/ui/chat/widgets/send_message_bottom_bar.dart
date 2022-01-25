import 'package:flutter/material.dart';

import 'widgets.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Padding(
      padding: padding,
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            SendMessageFormField(_formKey),
            SendMessageButton(_formKey),
          ],
        ),
      ),
    );
  }

  EdgeInsets get padding => const EdgeInsets.all(15.0);
}
