import '../chats_repository.dart';

abstract class ChatsRepository {
  Future<void> addNewChat({
    required Chat chat,
    required String employeeID,
    required String jobID,
  });
  Future<void> deleteChat({
    required Chat chat,
    String? employeeID,
    required String jobID,
    required String messageID,
  });
  Stream<List<Chat>> chats({
    required String jobID,
    required String employeeID,
  });
  Future<void> updateChat({
    required Chat chat,
    String? employeeID,
    String? jobID,
    String? messageID,
  });
  Stream<bool> isRead({
    required String jobID,
    required String employeeID,
  });
}
