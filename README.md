# 📝 UpTodo - Flutter To-Do App

A modern to-do list app built with **Flutter**, using **Supabase** for backend and **BLoC** for state management. It supports light/dark themes, localization, and real-time task storage.

## 🚀 Features

- Login and Register functionality
- Add tasks with title, date, time, and priority
- View tasks on the home screen
- Clean and dark UI design
- Supports English and Arabic languages
- State management using BLoC
- Cloud sync with Supabase

## 🛠️ Technologies Used

- Flutter 3.8+
- Supabase
- flutter_bloc
- get_it
- intl
- flutter_localizations


## 📸 Screenshots

| Splash Screen           | Onboarding 1           | Onboarding 2           |
|------------------------|------------------------|------------------------|
| ![](assets/images/screenshot1.png) | ![](assets/images/screenshot2.png) | ![](assets/images/screenshot3.png) |

| Onboarding 3           | Start Screen           | Register Screen        |
|------------------------|------------------------|------------------------|
| ![](assets/images/screenshot4.png) | ![](assets/images/screenshot5.png) | ![](assets/images/screenshot6.png) |

| Home Screen            | Calendar View          | Time Picker            |
|------------------------|------------------------|------------------------|
| ![](assets/images/screenshot7.png) | ![](assets/images/screenshot8.png) | ![](assets/images/screenshot9.png) |

| Priority Selector      | Task Details (Empty)   | Calendar Today View    |
|------------------------|------------------------|------------------------|
| ![](assets/images/screenshot10.png) | ![](assets/images/screenshot11.png) | ![](assets/images/screenshot12.png) |

| Choose Category Screen | Create Category Screen |                          |
|------------------------|------------------------|--------------------------|
| ![](assets/images/screenshot13.png) | ![](assets/images/screenshot14.png) |                          |


## 🧾 Getting Started

### 1. Install dependencies

```bash
flutter pub get
2. Connect to Supabase
In main.dart, replace:

await Supabase.initialize(
  url: 'hhttps://rjthvmrfcjqxnpgewpsx.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJqdGh2bXJmY2pxeG5wZ2V3cHN4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg4MzI1NTEsImV4cCI6MjA2NDQwODU1MX0.g3-F17TMaYo_2rqI7bFXyymOI6kBm_mDMgZ1GLFM3N8',
);


3. Run the app
flutter run

# auther
Ameerah Aloufi