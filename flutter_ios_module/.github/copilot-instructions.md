# Flutter iOS Module - AI Coding Guidelines

## Project Overview
This is a Flutter application for Changan automobile control interface, featuring vehicle status monitoring and remote control capabilities.

## Architecture & Structure
- **Single-page app** with `ChanganCarControlHome` as the main widget
- **State management**: Simple `StatefulWidget` with `setState()` for UI updates
- **Key components**:
  - Car info display (model, license plate, battery, mileage)
  - Control buttons (lock/unlock, air conditioning)
  - Data visualization area
- **Separate widgets**: `AutoHomePageHeader` for reusable header components

## UI/UX Patterns
- **Color scheme**: 
  - Primary: `Color(0xFF0066CC)` (Changan blue)
  - Secondary: `Color(0xFFF5A623)` (Orange accent)
  - Background: `Color(0xFFF5F7FA)`
- **Typography**: `fontFamily: 'PingFang SC'` for Chinese text support
- **Chinese localization**: All user-facing text must be in Chinese
- **Feedback patterns**: 
  - Loading states with `_isLoading` boolean
  - Snackbar notifications for operation results
  - 800ms simulated delay for async operations
- **Layout patterns**:
  - GridView with `crossAxisCount: 4` and `childAspectRatio: 1.1` for control buttons
  - Stack widgets for overlaying loading indicators on icons
  - `mainAxisSize: MainAxisSize.min` on Columns to prevent overflow
  - Fixed heights on scrollable areas (e.g., `height: 140` for control grid)

## Code Conventions
- **Async operations**: Use `Future<void>` with loading prevention (`if (_isLoading) return`)
- **State safety**: Check `mounted` before using `context` in async callbacks
- **Widget building**: Private methods like `_buildCarInfoCard()` for component organization
- **Constants**: Define magic numbers as class fields (e.g., `_batteryPercent`)

## Testing
- Update `widget_test.dart` to test actual car control features instead of default counter
- Test car status display, control button interactions, and state changes

## Build & Run
- Standard Flutter commands: `flutter run`, `flutter build ios`
- iOS focus: Project configured for iOS deployment with landscape orientation support
- No custom build scripts or CI workflows currently implemented

## Key Files
- `lib/main.dart`: Main app structure and car control logic
- `lib/AutoHomePageHeader.dart`: Reusable header widget
- `pubspec.yaml`: Basic Flutter dependencies only
- `analysis_options.yaml`: Standard Flutter linting rules</content>
<parameter name="filePath">/Users/taojiang/Desktop/poxiao/flutterNewPage/flutter_ios_module/.github/copilot-instructions.md