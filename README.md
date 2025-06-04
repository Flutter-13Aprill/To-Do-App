# UpToDo – Flutter To-Do Application with Supabase Authentication

> **UpToDo** is a sleek, cross-platform Flutter application that helps you manage your daily tasks. It leverages [Supabase](https://supabase.com/) for user authentication (username-based) and persistent storage of “to-do” items. This README will guide you through the project structure, key dependencies, environment setup, and steps to install/run UpToDo on your local machine.

---
## Demo

![UpToDo Onboarding Demo](gif/todoapp.gif)

## Features

- **Username-Based Authentication**  
  - Sign up / Sign in using only a username (no email/password needed).  
  - Session management via Supabase’s built-in authentication API.

- **To-Do Management**  
  - Create, Read, Update, and Delete (CRUD) to-do items.  
  - Data is stored in Supabase PostgreSQL tables.  
  - Real-time updates: If you’re logged in from multiple devices, to-dos sync instantly.

- **Onboarding Flow**  
  - A smooth, multi-page introduction slider that explains the app’s core features.  
  - Easy navigation between onboarding screens with smooth page indicators.

- **Calendar View**  
  - View tasks on a monthly calendar (powered by `table_calendar`).  
  - Quickly jump to specific dates and see tasks scheduled for that day.

- **Localization (Easy Localization)**  
  - Multi-language support using `easy_localization`.  
  - English (default) out of the box. Additional languages can be added easily.

- **Responsive Design (Sizer)**  
  - Layout adapts to different screen sizes (phones/tablets) using the `sizer` package.  
  - Consistent UI on iOS and Android.

- **State Management (flutter_bloc + get_it)**  
  - Business logic and state flows are managed via `flutter_bloc`.  
  - Dependency injection and service location via `get_it`.

- **Environment Configuration (flutter_dotenv)**  
  - Sensitive API keys, Supabase URL, and Supabase Anon Key are stored in a `.env` file (not committed to source control).

- **Smooth Native Splash Screen**  
  - Boot-up splash screen configured via `flutter_native_splash`.

- **Icons & Fonts**  
  - `font_awesome_flutter` provides a rich set of vector icons.  
  - `intl` for date/number formatting in different locales.

---

## Tech Stack & Packages

Below is a complete list of the main pub dependencies used in this project. Version numbers correspond to what’s tested and verified as of this README:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management & Dependency Injection
  flutter_bloc: ^9.1.1
  get_it: ^8.0.3

  # Supabase Integration
  supabase_flutter: ^2.9.0

  # Environment Variables
  flutter_dotenv: ^5.2.1

  # Icons
  font_awesome_flutter: ^10.8.0

  # Internationalization / Localization
  easy_localization: ^3.0.7+1
  intl: ^0.20.2

  # Responsive Layout
  sizer: ^3.0.5

  # Model Mapping (JSON serialization)
  dart_mappable: ^4.5.0

  # Calendar View
  table_calendar: ^3.2.0

  # Native Splash Screen
  flutter_native_splash: ^2.4.6

  # Onboarding / Page Indicators
  smooth_page_indicator: ^1.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0 
  ```



Prerequisites
Before you begin, ensure you have the following installed on your development machine:

Flutter SDK (≥ 3.0.0)

Follow the official guide: Flutter Installation

Make sure you can run flutter doctor without any critical issues.

Dart SDK (bundled with Flutter)

Git

To clone this repository.

Supabase Account

Create a free account at https://app.supabase.io.

Create a new project (PostgreSQL database + Auth enabled).

Take note of the Project URL and Anon Key (for authentication).

IDE / Editor

VS Code, Android Studio, IntelliJ, or any editor of your choice with Flutter plugin.

Environment Variables
All sensitive keys (Supabase URL, Supabase Anon Key, etc.) are stored in a .env file at the project root. This file should not be committed to version control.

Create a file named .env in the root of the project and add the following keys:

Installation & Setup
Follow these steps to get a local copy up and running:


Running the App
Ensure Your Device / Emulator Is Ready

Android Emulator

iOS Simulator

Physical device connected via USB (with USB debugging enabled)

Run the App

```bash
Copy
Edit
flutter run
```



Contact
If you run into any issues or have questions, feel free to reach out:

Author: Solaiman AlDokhail


Happy coding! 🚀