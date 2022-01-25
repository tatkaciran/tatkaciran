import 'package:flutter/material.dart';
import 'package:instajobs/ui/add_job/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            onPressed: () {
              context
                  .read<ExpiryDateBloc>()
                  .add(AddExpiryDate(expiryDate: date.toString()));
            },
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
