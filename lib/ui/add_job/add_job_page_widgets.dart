import 'package:flutter/material.dart';
import 'package:instajobs/config/config.dart';
import 'package:instajobs/ui/add_job/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddJobPageWidgets {
  static SmoothPageIndicator smoothPageIndicator(PageController controller) =>
      SmoothPageIndicator(
        controller: controller,
        count: 6,
        effect: WormEffect(
          dotHeight: 7,
          dotWidth: 7,
          paintStyle: PaintingStyle.fill,
          dotColor: Colors.white.withOpacity(0.5),
          activeDotColor: Colors.white,
        ),
      );

  static List<Widget> get addressFieldChildren => [
        const SizedBox(height: 80),
        addJobItemsTitle('ADRES'),
        const SizedBox(height: 15),
        addJobItemsDescription(
          'İlanınız hangi şehirde yayınlansın.',
        ),
        cities
      ];

  static List<Widget> descriptionFieldChildren({
    dynamic Function(String?)? onChanged,
  }) =>
      [
        const SizedBox(height: 50),
        addJobItemsTitle('AÇIKLAMA'),
        const SizedBox(height: 15),
        addJobItemsDescription(
          'İlanını verdiğiniz işi tanımlayan bir açıklama yazın.',
        ),
        addJobTextFormField(
          hintText: 'iş ilanı hakkında bilgi',
          emptyFieldText: 'bu alan boş olamaz',
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          helperText: 'Örnek: İşimiz için Çalışacak eleman lazım',
          onChanged: onChanged,
        ),
      ];
  static List<Widget> salaryFieldChildren({
    dynamic Function(String?)? onChanged,
  }) =>
      [
        const SizedBox(height: 50),
        addJobItemsTitle('ÜCRET'),
        const SizedBox(height: 15),
        addJobItemsDescription(
          'İlanını verdiğiniz iş için ne kadar ücret ödeyeceksiniz?',
        ),
        addJobTextFormField(
          hintText: 'ücret',
          emptyFieldText: 'ücret girmelisiniz',
          keyboardType: TextInputType.number,
          helperText: 'Örnek: 150',
          onChanged: onChanged,
        ),
      ];

  static List<Widget> addJobPagePageViewChildren(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
  }) =>
      [
        buildAppBar(context),
        addressField,
        descriptionField,
        salaryField,
        expiryDateField,
        addEditButton(formKey),
      ];

  static AddEditButton addEditButton(GlobalKey<FormState> formKey) =>
      AddEditButton(formKey);

  static AddJobItemsDescription addJobItemsDescription(String description) =>
      AddJobItemsDescription(description: description);

  static AddJobItemsTitle addJobItemsTitle(String title) =>
      AddJobItemsTitle(title: title);

  static AddJobTextFormField addJobTextFormField({
    String? initialValue,
    bool? autofocus,
    String? hintText,
    String? emptyFieldText,
    dynamic Function(String)? onChanged,
    TextInputType? keyboardType,
    int? maxLines,
    String? helperText,
    Key? key,
  }) =>
      AddJobTextFormField(
        initialValue: initialValue,
        autofocus: autofocus,
        hintText: hintText!,
        emptyFieldText: emptyFieldText!,
        onChanged: onChanged!,
        keyboardType: keyboardType,
        maxLines: maxLines,
        helperText: helperText,
        key: key,
      );

  static Address get addressField => const Address();

  static Cities get cities => const Cities();

  static DescriptionField get descriptionField => const DescriptionField();

  static ExpiryDateField get expiryDateField => const ExpiryDateField();

  static ExpiryDateItem expiryDateItem({
    bool? isSelected,
    int? date,
    Key? key,
  }) =>
      ExpiryDateItem(
        isSelected: isSelected!,
        date: date!,
        key: key,
      );

  static SalaryField get salaryField => const SalaryField();

  static Column buildAppBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
          child: GestureDetector(
            onTap: () {
              context
                  .read<NavigationBloc>()
                  .add(const NavigationEvent.showAddJob(false));
            },
            child: SizedBox(
              height: 8,
              width: 60,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Text(
          'İş İlanı Ekle',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
