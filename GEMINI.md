# AI Instructions for CollabVerse

Welcome, AI agent! This guide will help you get up to speed with the CollabVerse codebase.

## Architecture Overview

This Flutter project follows a layered, feature-based architecture. The goal is to separate concerns and make the codebase scalable and maintainable.

- **`lib/core`**: Contains the application's core functionalities, which are shared across different features. This includes:

  - **`const`**: Application-wide constants.
  - **`enums`**: Common enumerations.
  - **`routes`**: The navigation and routing logic.
  - **`themes`**: The application's visual theme and styling.
  - **`utils`**: Utility functions and helper classes.

- **`lib/src`**: This is where the main application logic resides, organized by feature.

  - **`providers`**: Holds the state management logic using the `provider` package.
  - **`services`**: Contains business logic, such as interacting with Firebase services (`remote_services`) or local databases (`local_services`).
  - **`shared`**: Contains widgets and other code shared across multiple features.
  - **`ui`**: The presentation layer, containing pages and widgets, organized by feature (e.g., `auth`, `discover`).

- **`assets`**: Contains all static assets for the application, like icons and vectors.

## Key Libraries & Conventions

- **State Management**: We use the `provider` package for state management. When adding new state, create a `ChangeNotifier` in the `lib/src/providers` directory and provide it in the widget tree.

- **Routing**: The app uses a custom routing solution. To add a new page/route:

  1.  Add the route name constant to the `Routes` class in `lib/core/routes/route_names.dart`.
  2.  Add a `case` for your new route in the `generateAppRoutes` function in `lib/core/routes/routes_generator.dart`.
  3.  Navigate using `Navigator.pushNamed(context, Routes.yourNewRoute);`.

- **Theming**: The app uses a centralized theme defined in `lib/core/themes/base/app_theme.dart`.

  - Colors are defined in `lib/core/themes/base/color_scheme.dart`.
  - Text styles are in `lib/core/themes/base/text_theme.dart`.
  - To use theme colors and styles, use `Theme.of(context).colorScheme.primary` or `Theme.of(context).textTheme.headlineLarge`.

- **Backend**: Firebase is the primary backend. Services for `Auth`, `Firestore`, and `Storage` are abstracted in the `lib/src/services/remote_services` directory. Always interact with Firebase through these service classes, not directly in the UI.

- **Code Style**:
  - We use `flutter_lints` for analysis.
  - Imports are automatically sorted using the `import_sorter` package. Please ensure your imports are correctly formatted.
  - The line length is set to 120 characters.

## Developer Workflow

- **Adding Dependencies**: Do not manually edit `pubspec.yaml`. Use `flutter pub add <package_name>` to add a new dependency.

- **Running the App**: Use the standard `flutter run` command.

- **Building the App**: Use `flutter build <platform>`.

## Example: Adding a New Page

1.  Create your page widget in the appropriate feature folder under `lib/src/ui/`. For example: `lib/src/ui/profile/pages/profile_page.dart`.
2.  Add a new route name in `lib/core/routes/route_names.dart`: `static const String profile = '/profile';`
3.  Add the route to `lib/core/routes/routes_generator.dart`:
    ```dart
    case Routes.profile:
      return MaterialPageRoute(
        builder: (context) => ProfilePage(),
      );
    ```
4.  Navigate to the page: `Navigator.pushNamed(context, Routes.profile);`
