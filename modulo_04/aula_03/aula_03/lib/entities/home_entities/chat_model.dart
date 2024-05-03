class ChatModel {
  final String profilePicture;
  final String name;
  final String date;
  final int? notifications;
  ChatModel({
    required this.profilePicture,
    required this.name,
    required this.date,
    this.notifications,
  });
}
