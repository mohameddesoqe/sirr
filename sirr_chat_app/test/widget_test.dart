import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sirr_chat_app/main.dart';

void main() {
  testWidgets('App should start without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SirrChatApp());

    // Verify that the app starts successfully
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
