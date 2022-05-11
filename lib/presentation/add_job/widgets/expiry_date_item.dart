import 'package:flutter/material.dart';

class ExpiryDateItem extends StatelessWidget {
  final bool isSelected;
  final int date;
  const ExpiryDateItem({required this.isSelected, required this.date, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: DecoratedBox(
          decoration: _boxDecoration(),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            icon: Text(
              '$date',
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      border: _border(),
      shape: BoxShape.circle,
    );
  }

  Border _border() => isSelected
      ? Border.all(width: 1, color: Colors.white)
      : Border.all(width: 1, color: Colors.grey.shade700);
}
