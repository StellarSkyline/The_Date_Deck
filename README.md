# Date Deck

Date Deck is a Flutter application designed to solve the age-old problem: *"What should we do for date night?"*

It gamifies the decision-making process by presenting date ideas as a deck of cards that users can swipe through. It features multiple categories, local storage for favorites, and a clean, extensible architecture.


## 🚀 Key Features

*   **Interactive Card Swiping**: Uses `flutter_card_swiper` for a Tinder-like experience to browse date ideas.
*   **Categorized Decks**: Filter ideas by mood:
    *   🏃 **Active**: Hiking, bowling, etc.
    *   🎨 **Creative**: Pottery, painting, etc.
    *   🎮 **Games**: Board games, arcades, etc.
    *   🍳 **Cooking**: Baking, trying new recipes, etc.
*   **Favorites System**: Save your favorite ideas locally using a Room-like database (Floor).
*   **Add Your Own**: Submit new date ideas (simulated network request).

## 🛠 Tech Stack

*   **Framework**: [Flutter](https://flutter.dev/) (Dart)
*   **Architecture**: Clean Architecture (Data, Domain, Presentation layers)
*   **State Management**: [Provider](https://pub.dev/packages/provider)
*   **Local Database**: [Floor](https://pub.dev/packages/floor) (SQLite abstraction)
*   **Networking**: `http` package for API calls.
*   **Database**: `Firebase Real-time Database` Online Database

## 🏗 Architecture Overview

The project follows **Clean Architecture** principles to ensure scalability and testability.

### Folder Structure
```
lib/
└── feature/
    └── home/
        ├── core/           # Database config (DAO)
        ├── data/           # Repositories & Models
        ├── domain/         # Business Logic (ViewModels)
        └── presentation/   # UI (Screens & Components)
```

### Key Components
*   **HomeViewModel**: The brain of the application. It manages the state (current category, swipes) and acts as the bridge between the UI and the Data layer.
*   **DateDao**: Handles all local database operations (Insert, Delete, Query Favorites).
*   **HomeRepository**: Abstract the data sources. It decides whether to fetch data from the network or the local database.