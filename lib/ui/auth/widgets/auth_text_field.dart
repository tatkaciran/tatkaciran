import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final Key? textFieldKey;
  final Function(String?)? onChange;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? errorText;
  final bool? obscureText;

  const AuthTextField({
    this.textFieldKey,
    this.onChange,
    this.keyboardType,
    this.labelText,
    this.errorText,
    this.obscureText,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: textFieldKey ?? const Key('_auth_text_field_'),
      onChanged: onChange,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        helperText: '',
        errorText: errorText ?? '',
      ),
    );
  }
}
