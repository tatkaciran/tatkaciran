import 'package:flutter/material.dart';

class Cities extends StatelessWidget {
  const Cities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey[700]!),
            borderRadius: BorderRadius.circular(45),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: DropdownButtonFormField(
              autofocus: true,
              value: 'Şehir seç',
              isExpanded: true,
              style: const TextStyle(fontSize: 22, letterSpacing: 1),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                // helperText: 'Örnek: İstanbul',
                border: InputBorder.none,
                alignLabelWithHint: true,
                // hintText: 'İstanbul',
                // hintStyle: TextStyle(letterSpacing: 1, fontSize: 22),
              ),
              items: const [
                DropdownMenuItem(
                  value: '',
                  child: Center(child: Text('')),
                ),
                DropdownMenuItem(
                  value: '',
                  child: Center(child: Text('')),
                ),
                DropdownMenuItem(
                  value: '',
                  child: Center(child: Text('')),
                )
              ],
              onChanged: (String? value) {},
            ),
          ),
        );
      },
    );
  }
}
