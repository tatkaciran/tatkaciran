// ignore_for_file: avoid_print

import 'package:chats_repository/chats_repository.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/main_initializer.dart';
import 'package:instajobs/presentation/chat/blocs/chats/chats_bloc.dart';
import 'package:instajobs/presentation/chat/chat.dart';
import 'package:instajobs/presentation/messages/blocs/blocs.dart';
import 'package:messages_repository/messages_repository.dart';

class SendMessageButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SendMessageButton(this.formKey, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // JOB
    // Job job = context.select((JobBloc bloc) => (bloc.state as GetJobState).job);

    // CONTENT
    final String content = context.watch<ContentBloc>().state;

    // JOB ID
    final String _jobID = context.watch<SendMessageCubit>().state.jobID;

    // DISPLAY NAME
    final String _displayName =
        context.watch<SendMessageCubit>().state.displayName;

    // EMPLOYEE ID
    final String _employeeID =
        context.watch<SendMessageCubit>().state.employeeID;

    // EMPLOYER ID
    final String _employerID =
        context.watch<SendMessageCubit>().state.employerID;
    final String userID = user.id;
    return TextButton(
      child: const Icon(Icons.send),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());

        if (formKey.currentState!.validate()) {
          context.read<MessagesBloc>().add(
                AddMessage(
                    message: Message(
                        seen: [
                          user.id == _employerID ? _employeeID : _employerID
                        ],
                        jobID: _jobID,
                        displayName: _displayName,
                        isHidden: false,
                        employeeID: _employeeID,
                        employerID: _employerID,
                        content: content,
                        isRead: true),
                    employeeID: _employeeID,
                    jobID: _jobID),
              );
          context.read<MessagesBloc>().add(LoadMessages(userID));

          context.read<ChatsBloc>().add(
                AddChat(
                  chat: Chat(
                    photo: user.photo,
                    content: content,
                    senderID: user.id,
                    isHidden: false,
                    isRead: false,
                  ),
                  employeeID: _employeeID,
                  jobID: _jobID,
                ),
              );

          formKey.currentState?.reset();
        } else {
          print('is not valid');
        }
      },
    );
  }
}
