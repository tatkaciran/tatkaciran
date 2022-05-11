import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:instajobs/config/config.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/main_initializer.dart';

import 'package:instajobs/presentation/chat/chat.dart';
import 'package:instajobs/presentation/messages/blocs/blocs.dart';
import 'package:messages_repository/messages_repository.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'blocs/blocs.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);
  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const Messages(),
      );

  @override
  Widget build(BuildContext context) {
    MessagesState state = context.watch<MessagesBloc>().state;

    if (state.messages == []) return const NoNewMessages();

    final List<Message?> messages = state.messages ?? [];
    return LoadedMessages(messages: messages);
  }
}

class LoadedMessages extends StatelessWidget {
  const LoadedMessages({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<Message?>? messages;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: CupertinoScrollbar(
        thickness: 5,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: messages?.length,
          itemBuilder: (BuildContext context, int i) {
            //! MESSAGE
            Message message = messages![i]!;
            //! IS CURRENT USER
            // bool isCurrentUser = message.employeeID == _userID ||
            //         message.employerID == _userID ??
            //     true;
            return AnimationConfiguration.staggeredList(
              position: i,
              duration: const Duration(milliseconds: 450),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: MessageItems(
                    message: message,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MessageItems extends StatelessWidget {
  final Message? message;
  const MessageItems({this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! USER ID
    final String _userID = user.id;

    return ListTile(
      onTap: () {
        context.read<ChatManager>().fromMessagesToChat(context, message!);
        context.read<NavigationCubit>().showChat(true);
      },
      leading: const Avatar(),
      title: Text(message?.displayName ?? '').fontSize(17),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message?.content ?? '').padding(all: 4),
          Text(
            timeago.format(
              ((message ?? Message.empty).timestamp ?? DateTime.now()),
              locale: 'tr',
            ),
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
      // MEsaj durum statusu yaz enum { gönderildi, gönderilemedi, beklemede }
      // gönderildi, boş, okundu, gri, yenimesaj yeşil
      trailing: ((message ?? Message.empty).seen ?? [])
              .any((member) => member == _userID)
          ? const Icon(CupertinoIcons.circle_fill)
              .iconColor(Colors.green)
              .iconSize(20)
          : const Icon(CupertinoIcons.circle).iconSize(20),
    );
  }
}

class NoNewMessages extends StatelessWidget {
  const NoNewMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _deviceSize = context.deviceSize;
    return SizedBox(
      height: _deviceSize.height,
      width: _deviceSize.width,
      child: Column(
        children: const [
          Expanded(
            flex: 5,
            child: Icon(
              Icons.mark_chat_unread_outlined,
              size: 180,
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              'There is no new message here.\nCome back later!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Roses are red,\nViolets are blue,\nThere is no new message,\nFor you!',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
