class ChatModel {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final String avatar;
  final int unreadCount;
  final bool isTyping;
  final bool isOnline;
  final bool isGroup;
  final bool isFavorite;
  final bool isScheduled;
  final String? messageType; // 'text', 'image', 'voice', 'deleted'
  final int? voiceDuration;

  ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatar,
    this.unreadCount = 0,
    this.isTyping = false,
    this.isOnline = false,
    this.isGroup = false,
    this.isFavorite = false,
    this.isScheduled = false,
    this.messageType,
    this.voiceDuration,
  });
}

class StoryModel {
  final String id;
  final String name;
  final String avatar;
  final bool hasStory;
  final bool isAddStory;

  StoryModel({
    required this.id,
    required this.name,
    required this.avatar,
    this.hasStory = false,
    this.isAddStory = false,
  });
}
