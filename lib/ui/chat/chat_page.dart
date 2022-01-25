import 'package:instajobs/constants/constants.dart';

import 'package:instajobs/ui/chat/chat.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const ChatPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContentBloc>(
      create: (context) => ContentBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: const [
                ChatAppBar(),
                ChatMessages(),
                ChatBottomBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}
