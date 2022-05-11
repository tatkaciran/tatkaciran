import 'package:flutter/material.dart';

class JobItemDescriptionView extends StatelessWidget {
  const JobItemDescriptionView({Key? key, required this.description})
      : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: GestureDetector(
        onTap: () {},
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 250),
          child: SingleChildScrollView(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 0.7,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
