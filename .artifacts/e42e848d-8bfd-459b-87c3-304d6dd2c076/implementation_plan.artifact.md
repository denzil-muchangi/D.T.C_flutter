# Refactor to Feature-First File Structure

The goal is to reorganize the project into a "Feature-first" structure, which is the recommended approach for Flutter scalability and maintainability.

## Proposed Changes

### Core Structure
We will move code out of `lib/main.dart` into specialized directories.

#### [NEW] [app.dart](file:///C:/Users/magen/StudioProjects/Dynamic_Text_Changer_Flutter/lib/app.dart)
Contains the `MyApp` widget, handling `MaterialApp` configuration and theming.

#### [MODIFY] [main.dart](file:///C:/Users/magen/StudioProjects/Dynamic_Text_Changer_Flutter/lib/main.dart)
Reduced to a clean entry point that calls `runApp(const MyApp())`.

### Text Changer Feature
We will encapsulate all logic and UI related to the text changer in its own feature directory.

#### [NEW] [text_changer_page.dart](file:///C:/Users/magen/StudioProjects/Dynamic_Text_Changer_Flutter/lib/features/text_changer/presentation/pages/text_changer_page.dart)
The main screen for the text changer feature.

## Verification Plan

### Automated Tests
- Run `flutter test` to ensure basic functionality remains intact (though the current project has minimal tests).

### Manual Verification
- Run the app and verify the "Dynamic Text Changer" still functions correctly: typing in the field updates the display text.
