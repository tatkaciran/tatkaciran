import 'package:flutter/material.dart';

import 'add_job_items_description.dart';
import 'add_job_items_title.dart';
import 'expiry_date_item.dart';

enum ExpiryDate { one, three, five, seven }

class ExpiryDateField extends StatelessWidget {
  const ExpiryDateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int expiryDate = 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const AddJobItemsTitle('İLAN SÜRESİ'),
          const SizedBox(height: 15),
          const AddJobItemsDescription(
            'İnsanlar verdiğiniz iş ilanına kaç gün boyunca dönüş yapabilsinler.',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ExpiryDate.values.map(
                (date) {
                  int enumToDate() {
                    if (date.index == 0) return 1;
                    if (date.index == 1) return 3;
                    if (date.index == 2) return 5;
                    if (date.index == 3) return 7;
                    return 0;
                  }

                  bool _isSelected = expiryDate == enumToDate() ? true : false;

                  int _date = enumToDate();

                  return ExpiryDateItem(
                    isSelected: _isSelected,
                    date: _date,
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
