import 'package:flutter/material.dart';

class AddEditButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AddEditButton(this.formKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        child: Padding(
          padding: padding,
          child: buttonTitle,
        ),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            // _isEditing = false;
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Text get buttonTitle => const Text(
        'İlanı Onayla',
        style: TextStyle(fontSize: 18),
      );

  EdgeInsets get padding => const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 100,
      );

  EdgeInsets get margin => const EdgeInsets.only(
        top: 400,
        bottom: 400,
      );
}
