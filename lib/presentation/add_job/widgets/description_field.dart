import 'package:flutter/material.dart';

import 'add_job_items_description.dart';
import 'add_job_items_title.dart';
import 'add_job_text_form_field.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const AddJobItemsTitle('AÇIKLAMA'),
          const SizedBox(height: 15),
          const AddJobItemsDescription(
            'İlanını verdiğiniz işi tanımlayan bir açıklama yazın.',
          ),
          AddJobTextFormField(
              hintText: 'iş ilanı hakkında bilgi',
              emptyFieldText: 'bu alan boş olamaz',
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              helperText: 'Örnek: İşimiz için Çalışacak eleman lazım',
              onChanged: (x) => x),
        ],
      ),
    );
  }
}
