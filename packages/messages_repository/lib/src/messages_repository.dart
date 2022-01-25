import '../messages_repository.dart';

abstract class MessagesRepository {
  Future<void> addNewMessage(
      {required Message message,
      required String employeeID,
      required String jobID});
  Future<void> deleteMessage(Message message);
  Stream<List<Message>> messages(String userID);
  Future<void> updateMessage(
      {required Message message,
      required String employeeID,
      required String jobID});
}
