Project Title
News App 📰

Description
A Flutter News Application that allows users to browse the latest news, filter articles by categories, and search for specific news using a REST API.

## Features

- Splash Screen with 3-second duration
- Browse latest news articles
- Filter news by categories
- Search for news articles
- API integration for fetching real-time news
- Search results screen
- Carousel animation
- Bottom Navigation Bar
- Custom dialogs
- Error handling for network images
- Loading states
- State management using Cubit / BLoC
- Responsive Flutter UI

  
  ## 🛠️ Packages & Technologies

- **Flutter & Dart** — Used to build the application and its user interface.
- **flutter_bloc** — Used for state management with Cubit.
- **Dio** — Used to make REST API requests and handle API responses.
- **Pretty Dio Logger** — Used to log API requests and responses during development and debugging.
- **Curved Navigation Bar** — Used to implement the custom curved bottom navigation bar.
- **Cupertino Icons** — Used for additional icons.

## 🧠 State Management

The application uses **Cubit with flutter_bloc** for state management.

### Cubit

Cubit is used to manage the application's data flow and handle the different states while fetching and displaying news.

The application handles:

- **Loading State** — Shows a loading indicator while fetching news from the API.
- **Success State** — Displays the news articles after successfully receiving the API response.
- **Failure State** — Handles API or network errors and displays an error message.

### BlocProvider

`BlocProvider` is used to provide `HomeCubit` to the widget tree and make it accessible to the widgets that need it.

### BlocBuilder

`BlocBuilder` listens to changes in the Cubit's state and rebuilds the UI based on the current state.

## 🌐 API Integration

The application uses a **REST API** to fetch news dynamically.

The API is used for:

- Fetching news articles.
- Searching for news.
- Filtering news by categories.
- Receiving and displaying dynamic news data.

**Dio** is used to handle the API requests, while **Pretty Dio Logger** is used during development to monitor requests and responses.

## 🔎 Search & Filtering

The application provides:

- A dedicated **Search Screen** for searching for specific news.
- **Category filtering** on the Home Screen.
- Dynamic updates based on the selected category.
- Navigation between the Home, Search, and Details screens.

## 🖼️ Network Images

News images are loaded dynamically from the API using `Image.network`.

The application also handles invalid or unavailable image URLs using `errorBuilder` and displays a fallback image when the original image cannot be loaded.

## 🎨 UI & Flutter Concepts

- Splash Screen with timed navigation.
- Curved Bottom Navigation Bar.
- Horizontal category list.
- News list using `ListView.builder`.
- Search screen.
- News details screen.
- Dialogs for user interaction.
- Animated / carousel UI elements.
- Custom text styles.
- Loading and error handling.
- Screen navigation.
- Network image fallback handling.

## 🎬 Demo

A short demo showcasing the main application flow:

**Splash Screen → Home → Categories → News → Details → Search → Search Results**

## 📸 Screenshots

### Splash Screen

![Splash Screen](assets/screenshots/splash.png)

### Home Screen

![Splash Screen](assets/screenshots/home.png)


### Search Screen
![Splash Screen](assets/screenshots/search.png)

### Search Results

![Splash Screen](assets/screenshots/searchresults.png)

### News Details

![Splash Screen](assets/screenshots/details.png)
### News Details

![Splash Screen](assets/screenshots/details2.png)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code

### Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/news_app.git
```

Navigate to the project:

```bash
cd news_app
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```
