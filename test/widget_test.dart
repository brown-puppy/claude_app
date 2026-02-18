import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:claude_app/main.dart';

void main() {
  testWidgets('Empty state shows greeting', (WidgetTester tester) async {
    await tester.pumpWidget(const ClaudeApp());

    expect(find.text('How can I help you?'), findsOneWidget);
    expect(find.text("Ask me anything — I'm here to assist."), findsOneWidget);
  });

  testWidgets('Sending a message displays user bubble and Claude reply',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ClaudeApp());

    // Empty state should be visible before sending
    expect(find.text('How can I help you?'), findsOneWidget);

    // Type a message and send
    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.tap(find.byType(FilledButton));
    await tester.pump();

    // User message bubble
    expect(find.text('Hello'), findsOneWidget);

    // Hardcoded Claude reply
    expect(
      find.textContaining("I'm Claude"),
      findsOneWidget,
    );

    // Empty state should be gone
    expect(find.text('How can I help you?'), findsNothing);
  });

  testWidgets('Empty input does not add messages', (WidgetTester tester) async {
    await tester.pumpWidget(const ClaudeApp());

    await tester.tap(find.byType(FilledButton));
    await tester.pump();

    // Empty state still shown — no messages added
    expect(find.text('How can I help you?'), findsOneWidget);
  });
}
