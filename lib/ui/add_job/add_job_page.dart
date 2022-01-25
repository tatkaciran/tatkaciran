import 'package:flutter/material.dart';
import 'package:instajobs/constants/add_job_tab.dart';
import 'package:instajobs/ui/add_job/add_job.dart';
import 'package:instajobs/ui/auth/auth.dart';

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
    // final Size _deviceSize = context.deviceSize;

    return MultiBlocProvider(
      providers: [
        BlocProvider<AddressBloc>(create: (context) => AddressBloc()),
        BlocProvider<DescriptionBloc>(create: (context) => DescriptionBloc()),
        BlocProvider<ExpiryDateBloc>(create: (context) => ExpiryDateBloc()),
        BlocProvider<SalaryBloc>(create: (context) => SalaryBloc()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Form(
              key: formKey,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    children: AddJobPageWidgets.addJobPagePageViewChildren(
                      context,
                      formKey: formKey,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 30,
                    child: Center(
                        child: AddJobPageWidgets.smoothPageIndicator(
                      _pageController,
                    )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
