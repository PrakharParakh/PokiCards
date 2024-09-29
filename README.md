# PokiCardsApp

PokiCardsApp is an interactive Pokémon app that allows users to explore, bookmark, and manage their favorite Pokémon. The app consists of three main sections: Home, Bookmarks, and Settings, offering a Tinder-like card swipe experience, local data storage with bookmarks, and customizable app settings.

## Features

### 1. **Home Section**
- **Swipeable Pokémon Cards**: 
  - The Home section displays a list of Pokémon in the form of Tinder-like cards. Users can swipe left to remove a card or swipe right to open the Pokémon details page.
  - Each card shows details such as Pokémon name, image, and an option to bookmark the Pokémon directly.
  
- **Bookmark Pokémon**: 
  - Users can bookmark a Pokémon from the details page or directly from the Home card view.
  
- **View Pokémon Details**: 
  - Swiping right on a card opens the details page, where users can view detailed information about the Pokémon and choose to bookmark it.

### 2. **Bookmarks Section**
- **Bookmarked Pokémon List**: 
  - The Bookmarks section contains a list of all Pokémon that users have bookmarked.
  
- **Local Storage with SwiftData**: 
  - Bookmarks are stored locally on the device using SwiftData, ensuring persistence across app launches.
  
- **Manage Bookmarks**: 
  - Users can view, delete, or manage their bookmarked Pokémon from this section.

### 3. **Settings Section**
- **App Version**: 
  - The Settings section displays the current app version.
  
- **App Appearance (Themes)**: 
  - Users can switch between different themes, allowing customization of the app's appearance.
  
- **Feedback & More**: 
  - Users can send feedback and suggestions through the app’s feedback section.
  - Additional features may be added to the Settings section, such as notifications and privacy settings.

## Roadmap

### Version 1.0 - MVP (Minimum Viable Product)
- **Home Section**:
  - Implement swipeable Pokémon card stack with left (remove) and right (details) swipe actions.
  - Display Pokémon details page with bookmark option.
  
- **Bookmarks Section**:
  - Develop a list view to display bookmarked Pokémon.
  - Implement local data storage with SwiftData to save bookmarks.
  
- **Settings Section**:
  - Display app version and basic feedback form.
  - Implement basic theme switching for light and dark modes.

### Version 1.1 - Enhancements
- **Home Section**:
  - Add animations for card swipes and transitions to the details page.
  - Add search functionality to find specific Pokémon by name.
  
- **Bookmarks Section**:
  - Enable drag-and-drop reordering of bookmarked Pokémon.
  
- **Settings Section**:
  - Expand theme options with more color schemes and appearance settings.
  - Add a toggle for enabling/disabling swipe animations.

### Version 1.2 - New Features
- **Home Section**:
  - Integrate Pokémon filtering by type or region.
  - Implement a “Recently Removed” section to allow users to recover swiped Pokémon.
  
- **Bookmarks Section**:
  - Add an option to share favorite Pokémon with friends or on social media.

- **Settings Section**:
  - Introduce notification preferences for new Pokémon updates.
  - Add privacy settings and support for account management features.

---

## Getting Started

To run the project locally:

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run on the iOS Simulator or an actual device.

### Requirements
- iOS 14.0+
- Xcode 12.0+
  
### Installation

```bash
git clone https://github.com/PrakharParakh/PokiCards.git
cd PokiCardsApp
open PokiCardsApp.xcodeproj
```

## Contributing

If you'd like to contribute to the app, please submit a pull request or open an issue for suggestions.

---

This roadmap gives you a clear structure for developing and scaling the PokiCardsApp with upcoming features and improvements.
