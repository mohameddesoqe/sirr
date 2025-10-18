import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class StoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stories = [
      StoryModel(
        id: '1',
        name: 'سعود',
        avatar: 'assets/avatars/saud.jpg',
        hasStory: true,
      ),
      StoryModel(
        id: '2',
        name: 'فاطمة',
        avatar: 'assets/avatars/fatima.jpg',
        hasStory: true,
      ),
      StoryModel(
        id: '3',
        name: 'نورة',
        avatar: 'assets/avatars/noura.jpg',
        hasStory: true,
      ),
      StoryModel(
        id: '4',
        name: 'محمد',
        avatar: 'assets/avatars/mohammed.jpg',
        hasStory: true,
      ),
      StoryModel(
        id: '5',
        name: 'قصصي',
        avatar: 'assets/avatars/qasasi.jpg',
        isAddStory: true,
      ),
    ];

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Container(
            width: 70,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: story.isAddStory ? Colors.grey[300] : Colors.blue,
                        border: story.hasStory && !story.isAddStory
                            ? Border.all(color: Colors.blue, width: 2)
                            : null,
                      ),
                      child: story.isAddStory
                          ? Icon(Icons.add, color: Colors.white, size: 24)
                          : CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Text(
                                story.name[0],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                    if (story.hasStory && !story.isAddStory)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(
                            Icons.access_time,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  story.name,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
