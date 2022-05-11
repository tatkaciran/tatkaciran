import 'package:flutter/material.dart';

import 'add_job_items_description.dart';
import 'add_job_items_title.dart';
import 'add_job_text_form_field.dart';

class SalaryField extends StatelessWidget {
  const SalaryField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const AddJobItemsTitle('ÜCRET'),
          const SizedBox(height: 15),
          const AddJobItemsDescription(
            'İlanını verdiğiniz iş için ne kadar ücret ödeyeceksiniz?',
          ),
          AddJobTextFormField(
            hintText: 'ücret',
            emptyFieldText: 'ücret girmelisiniz',
            keyboardType: TextInputType.number,
            helperText: 'Örnek: 150',
            onChanged: (x) => x,
          ),
        ],
      ),
    );
  }
}
