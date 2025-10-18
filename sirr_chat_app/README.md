# Sirr Chat App

A Flutter chat application with Arabic interface, designed to replicate the messaging app shown in the provided image.

## Features

- **Arabic Language Support**: Full RTL (Right-to-Left) text support
- **Modern UI Design**: Clean, modern interface with blue accent colors
- **Stories Section**: Horizontal scrollable stories/contacts
- **Filter Tabs**: Filter conversations by All, Unread, Scheduled, and Favorites
- **Chat List**: Comprehensive chat list with various message types
- **Bottom Navigation**: Settings, Updates, and Chats tabs
- **Floating Action Button**: Quick access to create new chats

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── chat_model.dart      # Data models for chats and stories
├── screens/
│   └── chat_screen.dart     # Main chat screen
└── widgets/
    ├── stories_widget.dart      # Stories/contacts section
    ├── filter_tabs_widget.dart  # Filter tabs
    ├── chat_list_widget.dart    # Chat list
    └── bottom_navigation_widget.dart # Bottom navigation
```

## Getting Started

1. Make sure you have Flutter installed on your system
2. Clone or download this project
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

- `flutter`: Flutter SDK
- `google_fonts`: For Arabic font support (Cairo font)
- `cupertino_icons`: iOS-style icons

## Arabic Text Support

The app uses Google Fonts with Cairo font family to properly display Arabic text. The text direction is automatically handled by Flutter's RTL support.

## Customization

You can easily customize:
- Colors by modifying the theme in `main.dart`
- Fonts by changing the Google Fonts configuration
- Chat data by modifying the sample data in the widget files
- UI components by editing the individual widget files

## Screenshots

The app replicates the interface shown in the provided image with:
- Status bar with time and system icons
- Header with navigation icons and app branding
- Horizontal stories section
- Filter tabs with counts
- Chat list with various message types
- Bottom navigation bar
- Floating action button

## Future Enhancements

- Real chat functionality
- Push notifications
- File sharing
- Voice messages
- Group chat management
- User authentication
