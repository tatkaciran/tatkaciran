import 'package:flutter/material.dart';
import 'package:instajobs/constants/add_job_tab.dart';
import 'package:instajobs/presentation/add_job/add_job.dart';

import 'add_job_page_widgets.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const AddJobScreen(),
      );

  @override
  _AddJobScreenState createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: AddJobTab.intro,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: formKey,
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  children: [
                    const _BuildAppBar(),
                    const Address(),
                    const DescriptionField(),
                    const SalaryField(),
                    const ExpiryDateField(),
                    AddEditButton(formKey),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: Center(
                      child: IJSmoothPageIndicator(
                    pageController: _pageController,
                  )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BuildAppBar extends StatelessWidget {
  const _BuildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
          child: GestureDetector(
            onTap: () {},
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
