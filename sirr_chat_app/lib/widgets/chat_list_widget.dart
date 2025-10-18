import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatListWidget extends StatelessWidget {
  final String selectedFilter;

  const ChatListWidget({
    super.key,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    final chats = [
      ChatModel(
        id: '1',
        name: 'محمد عبدالله',
        lastMessage: 'السلام عليكم، أحتاج إلى تقرير الأداء الشهري لفريق العمل في قسمك في أ...',
        time: '16:14',
        avatar: 'assets/avatars/mohammed_abdullah.jpg',
        unreadCount: 5,
        isFavorite: true,
      ),
      ChatModel(
        id: '2',
        name: 'فاطمة سعود فهد',
        lastMessage: 'فاطمة تقوم بالكتابة...',
        time: '19:45',
        avatar: 'assets/avatars/fatima_saud.jpg',
        unreadCount: 1,
        isTyping: true,
        isOnline: true,
      ),
      ChatModel(
        id: '3',
        name: 'سعود عبدالعزيز راشد',
        lastMessage: 'صورة',
        time: '19:42',
        avatar: 'assets/avatars/saud_abdulaziz.jpg',
        messageType: 'image',
      ),
      ChatModel(
        id: '4',
        name: 'نورة وليد سامي',
        lastMessage: 'لقد حذفت هذه الرسالة.',
        time: '08:57',
        avatar: 'assets/avatars/noura_waleed.jpg',
        messageType: 'deleted',
        isScheduled: true,
      ),
      ChatModel(
        id: '5',
        name: 'جروب شؤون الموظفين',
        lastMessage: 'نود إعلامكم بأنه سيتم تحديث نظام البريد الإلكتروني الداخلي يوم الخميس القادم من ا...',
        time: '16:15',
        avatar: 'assets/avatars/hr_group.jpg',
        isGroup: true,
      ),
      ChatModel(
        id: '6',
        name: 'مشروع التميز الاستثمار',
        lastMessage: '0:25',
        time: '14:30',
        avatar: 'assets/avatars/investment_project.jpg',
        isGroup: true,
        messageType: 'voice',
        voiceDuration: 25,
      ),
    ];

    List<ChatModel> filteredChats = chats.where((chat) {
      switch (selectedFilter) {
        case 'غير مقروء':
          return chat.unreadCount > 0;
        case 'رسائل مجدولة':
          return chat.isScheduled;
        case 'المفضلة':
          return chat.isFavorite;
        default:
          return true;
      }
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredChats.length,
      itemBuilder: (context, index) {
        final chat = filteredChats[index];
        return ChatListItem(chat: chat);
      },
    );
  }
}

class ChatListItem extends StatelessWidget {
  final ChatModel chat;

  const ChatListItem({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Avatar
          Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: chat.isGroup ? Colors.grey[300] : Colors.blue[100],
                ),
                child: chat.isGroup
                    ? Icon(
                        Icons.group,
                        color: Colors.blue,
                        size: 24,
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Text(
                          chat.name.split(' ').map((e) => e[0]).join(''),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
              ),
              if (chat.isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          
          SizedBox(width: 12),
          
          // Chat Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            chat.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (chat.isOnline) ...[
                            SizedBox(width: 4),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ],
                        ],
                      ),
                    ),
                    Text(
                      chat.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          if (chat.messageType == 'image') ...[
                            Icon(Icons.attach_file, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Icon(Icons.check_circle_outline, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Icon(Icons.check_circle_outline, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 4),
                          ] else if (chat.messageType == 'voice') ...[
                            Icon(Icons.mic, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Icon(Icons.check_circle_outline, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 4),
                          ] else if (chat.messageType == 'deleted') ...[
                            Icon(Icons.cancel, size: 16, color: Colors.red),
                            SizedBox(width: 4),
                          ],
                          Expanded(
                            child: Text(
                              chat.lastMessage,
                              style: TextStyle(
                                fontSize: 14,
                                color: chat.isTyping ? Colors.blue : Colors.grey[600],
                                fontWeight: chat.isTyping ? FontWeight.w500 : FontWeight.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        if (chat.unreadCount > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              chat.unreadCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        SizedBox(height: 4),
                        if (chat.isFavorite)
                          Icon(Icons.star, color: Colors.amber, size: 16),
                        if (chat.isScheduled)
                          Icon(Icons.schedule, color: Colors.orange, size: 16),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
