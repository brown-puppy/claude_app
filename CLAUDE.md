# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Install dependencies
flutter pub get

# Run app (on connected device/emulator)
flutter run

# Static analysis / lint
flutter analyze

# Run tests
flutter test

# Run a single test file
flutter test test/widget_test.dart

# Build
flutter build apk      # Android
flutter build web      # Web
flutter build windows  # Windows
```

## Architecture

Single-file Flutter app (`lib/main.dart`) implementing a Claude-themed chat UI. All application logic lives in one file.

**Widget hierarchy:**
- `ClaudeApp` (StatelessWidget) — root, sets up MaterialApp with warm orange theme (`#FFD97757`)
- `ClaudeHomePage` (StatefulWidget) — main screen
  - `_ClaudeHomePageState` — owns the message list (`List<_Message>`), `TextEditingController`, and `ScrollController`
  - `_MessageBubble` — renders individual chat bubbles (user messages right-aligned, Claude messages left-aligned)
  - `_Message` — data class with `text` and `isUser` fields

**State management:** Plain `setState()`. No external state management library.

**No API integration** — Claude responses are hardcoded placeholder text. The app is a UI demo only.

## Notes

- The test file (`test/widget_test.dart`) references `MyApp` and counter widgets that no longer exist — it is a stale Flutter template and will fail if run.
- Android targets Java 17, Kotlin 2.2.20, Gradle 8.11.1.
- Dart SDK requirement: `^3.10.3`.
