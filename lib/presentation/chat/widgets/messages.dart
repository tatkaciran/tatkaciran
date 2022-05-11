import 'package:chats_repository/chats_repository.dart';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/main_initializer.dart';

import 'package:instajobs/presentation/chat/blocs/chats/chats_bloc.dart';
import 'package:instajobs/presentation/home/widgets/widgets.dart';

import 'package:jobs_repository/jobs_repository.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:instajobs/presentation/chat/chat.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatsState state = context.watch<ChatsBloc>().state;

    while (state is ChatsNotLoaded || state is ChatsLoading) {
      return const NoChatMessage();
    }

    while (state is ChatsLoaded) {
      //     Job job = c

      return Expanded(
        child: Column(
          children: [
            const JobInChat(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                reverse: true,
                itemCount: state.chats.length,
                itemBuilder: (BuildContext context, int i) {
                  Chat _chat = state.chats[i];
                  String _senderID = _chat.senderID;
                  String _userID = user.id;
                  return _senderID == _userID
                      ? MessageTile(
                          chat: _chat,
                          mainAxisAlignment: MainAxisAlignment.end,
                        )
                      : MessageTile(chat: _chat);
                },
              ),
            ),
          ],
        ),
      );
    }
    return const Text('MessagesBloc not working!');
  }
}

class JobInChat extends StatelessWidget {
  const JobInChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).cardColor;
    Job job = context.watch<JobInChatBloc>().state;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _color,
      ),
      child: ExpandablePanel(
        collapsed: const SizedBox.shrink(),
        header: const Padding(
          padding: EdgeInsets.only(left: 55.0, top: 14, bottom: 12),
          child: Center(
              child: Text(
            'İş İlanını Göster',
            textScaleFactor: 1.2,
          )),
        ),
        expanded: JobItem(job, inChat: true),
      ),
    );
  }
}

class NoChatMessage extends StatelessWidget {
  const NoChatMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(50.0),
      child: Text(
        'Bu iş ilgini mi çekti?\nHadi durma işverenle iletişime geç!',
        textAlign: TextAlign.center,
        textScaleFactor: 1.1,
      ),
    ));
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({required this.chat, this.mainAxisAlignment, Key? key})
      : super(key: key);

  final MainAxisAlignment? mainAxisAlignment;
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final String _employeeID =
        context.watch<SendMessageCubit>().state.employeeID;
    final String _jobID = context.watch<SendMessageCubit>().state.jobID;
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            mainAxisAlignment == MainAxisAlignment.end
                ? Flexible(
                    child: Row(
                      children: [
                        TimeStamp(chat, mainAxisAlignment!),
                        IconButton(
                          color: Theme.of(context).iconTheme.color,
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            context.read<ChatsBloc>().add(
                                  UpdateChat(
                                      chat: chat.copyWith(
                                        isHidden: true,
                                        isRead: false,
                                      ),
                                      messageID: chat.messageID!,
                                      senderID: _employeeID,
                                      jobID: _jobID),
                                );
                          },
                          icon: const Icon(CupertinoIcons.delete_right),
                        ),
                      ],
                    ),
                  )
                : const Avatar(),
            Content(chat),
            mainAxisAlignment == MainAxisAlignment.end
                ? const SizedBox.shrink()
                : TimeStamp(chat, mainAxisAlignment ?? MainAxisAlignment.start),
          ],
        ),
      ],
    );
  }
}

class TimeStamp extends StatelessWidget {
  const TimeStamp(this.chat, this.mainAxisAlignment, {Key? key})
      : super(key: key);

  final Chat chat;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    DateTime? _timestamp = chat.timestamp;
    return Flexible(
      child: _timestamp == null
          ? const SizedBox.shrink()
          : Text(
              timeago.format(
                _timestamp,
                locale: 'tr',
              ),
              style: TextStyle(color: Colors.grey[700]),
            ),
    );
  }
}
