import 'package:flutter/material.dart';

class AddJobTextFormField extends StatelessWidget {
  const AddJobTextFormField({
    this.initialValue,
    this.autofocus,
    required this.hintText,
    required this.emptyFieldText,
    required this.onChanged,
    this.keyboardType,
    this.maxLines,
    this.helperText,
    Key? key,
  }) : super(key: key);

  final String? initialValue;
  final bool? autofocus;
  final String hintText;
  final String emptyFieldText;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        textAlign: TextAlign.center,
        initialValue: initialValue,
        maxLines: maxLines ?? 1,
        style: textTheme.headline5,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          helperText: helperText,
          fillColor: Colors.red,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(45.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(letterSpacing: 1),
        ),
        validator: (val) {
          return val!.trim().isEmpty ? emptyFieldText : null;
        },
        onChanged: onChanged,
      ),
    );
  }
}
