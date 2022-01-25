import 'package:flutter/material.dart';
import 'package:instajobs/config/managers/managers.dart';
import 'package:instajobs/ui/splash/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const SplashPage(),
      );

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<NavigationStateManager>().initializeApp(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddJobManager(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: const LogoAndTitle(),
      ),
    );
  }
}
