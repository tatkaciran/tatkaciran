import 'package:flutter/material.dart';
import 'package:instajobs/presentation/add_job/add_job_page_widgets.dart';
import 'package:instajobs/presentation/add_job/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ExpiryDate { one, three, five, seven }

class ExpiryDateField extends StatelessWidget {
  const ExpiryDateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int expiryDate = context.select(
        (ExpiryDateBloc bloc) => (bloc.state as GetExpiryDate).expiryDate);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          AddJobPageWidgets.addJobItemsTitle('İLAN SÜRESİ'),
          const SizedBox(height: 15),
          AddJobPageWidgets.addJobItemsDescription(
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

                  return AddJobPageWidgets.expiryDateItem(
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
