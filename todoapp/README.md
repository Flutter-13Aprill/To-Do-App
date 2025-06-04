# 📝 To-Do App with Supabase & Flutter

A complete and elegant To-Do application built with **Flutter** and **Supabase** for authentication and data storage. The app offers a smooth onboarding experience, custom task creation, and profile management features.

---

## 🚀 Features

### 1. **Splash Screen**
- Displays an introductory splash screen on app launch.

### 2. **Onboarding Screens**
- A set of 3 pages introducing the app.
- Includes:
  - **Next** button to go forward.
  - **Back** button to go backward.
  - **Skip** button to skip onboarding.

### 3. **Welcome Screen**
- Provides options for:
  - **Login**
  - **Sign Up**

---

## 🔐 Authentication (Using Supabase)

### 4. **Sign Up Screen**
- Allows users to register with email and password.
- Connected to **Supabase** for account creation.
- Uses `Form` validation to ensure fields are not empty.

### 5. **Login Screen**
- Users can log in using their Supabase account.
- Checks credentials against Supabase.
- Also uses `Form` validation for input checks.

---

## 🏠 Index (Home) Screen

### 6. **Floating Action Button**
- Allows users to add new tasks.

### 7. **Add Task Bottom Sheet**
When the FAB is pressed, a bottom sheet appears with:
- Task title input.
- Priority selection.
- Time picker for selecting a due time.
- Category selection.
- Option to create a new category.

### 8. **Task List**
- Displays tasks in a scrollable list.
- When a task is marked as completed:
  - A checkmark appears.
  - The text is struck through.

### 9. **Search Bar**
- A functional search bar for filtering tasks by title.

---

## 👤 Profile Screen

### 10. **Settings Options**
- Allows the user to:
  - Change their username.
  - Update their password.
  - Log out of the app.

---

## 🛠️ Tech Stack & Packages

- **Flutter** 🐦
- **Supabase** 🔐
- `easy_localization` 🌍
- `flutter_bloc` 🧠

---

## 📸 Screenshots
![page1](screenshoots\Screenshot 2025-06-02 095354.png)
![page2](screenshoots\Screenshot 2025-06-02 095434.png)
![page3](screenshoots\Screenshot 2025-06-02 095705.png)
![page4](screenshoots\Screenshot 2025-06-02 095800.png)
![page5](screenshoots\Screenshot 2025-06-02 095903.png)
![page6](screenshoots\Screenshot 2025-06-02 095929.png)
---

## 🧩 Additional Notes

- The app is built using the **BLoC pattern** for state management.
- Fully supports **multi-language localization** (e.g., English & Arabic).

---

## 🧑‍💻 Developed By
**Raghad Al-Saykhan** 💙