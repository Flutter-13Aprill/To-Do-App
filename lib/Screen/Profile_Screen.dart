<<<<<<< HEAD
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_development/Screen/Login_Screen.dart';
import 'package:to_do_app_development/Screen/Settings_Screen.dart';
import 'package:to_do_app_development/Screen/profile/cubit/name_cubit.dart';
import 'package:to_do_app_development/Screen/profile/cubit/image_cubit.dart';
import 'package:to_do_app_development/style/them_provider.dart'; // Import your ThemeProvider

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserNameCubit()),
        BlocProvider(create: (_) => ProfileImageCubit()),
      ],
      child: const _ProfileScreenBody(),
    );
  }
}

class _ProfileScreenBody extends StatelessWidget {
  const _ProfileScreenBody();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    final backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;
    final appBarColor = backgroundColor;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final secondaryTextColor = isDarkMode ? Colors.white70 : Colors.black54;
    final cardBackgroundColor =
        isDarkMode ? const Color(0xFF272727) : Colors.grey.shade200;
    final logoutColor = Colors.redAccent;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'profile'.tr(),
          style: TextStyle(
            color: textColor,
=======
import 'package:flutter/material.dart';
import 'package:to_do_app_development/Screen/Settings_Screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Avatar and Name
<<<<<<< HEAD
            BlocBuilder<ProfileImageCubit, File?>(
              builder: (context, imageFile) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          imageFile != null
                              ? FileImage(imageFile)
                              : const AssetImage('assets/Profile.png')
                                  as ImageProvider,
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<UserNameCubit, String>(
                      builder: (context, name) {
                        return Text(
                          name,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
=======
            Column(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/Profile.png'),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Fahad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
            ),

            const SizedBox(height: 24),

            // Task counters
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
<<<<<<< HEAD
                _buildStatBox(
                  "tasks_left".tr(args: ['1']),
                  cardBackgroundColor,
                  textColor,
                ),
                const SizedBox(width: 12),
                _buildStatBox(
                  "tasks_done".tr(args: ['1']),
                  cardBackgroundColor,
                  textColor,
                ),
=======
                _buildStatBox("10 Task left"),
                const SizedBox(width: 12),
                _buildStatBox("5 Task done"),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
              ],
            ),

            const SizedBox(height: 32),

<<<<<<< HEAD
            _buildSectionTitle("settings".tr(), secondaryTextColor),
            SizedBox(height: 0),
            _buildMenuTile(
              Icons.settings,
              "app_settings".tr(),
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              textColor,
              secondaryTextColor,
            ),
            const SizedBox(height: 24),

            _buildSectionTitle("account".tr(), secondaryTextColor),
            _buildMenuTile(
              Icons.person_outline,
              "change_account_name".tr(),
              () {
                _showChangeNameDialog(context, isDarkMode);
              },
              textColor,
              secondaryTextColor,
            ),
            _buildMenuTile(
              Icons.image_outlined,
              "change_account_image".tr(),
              () {
                _showChangeImageBottomSheet(context, isDarkMode);
              },
              textColor,
              secondaryTextColor,
            ),
            const SizedBox(height: 24),

            ListTile(
              leading: Icon(Icons.logout, color: logoutColor),
              title: Text(
                "log_out".tr(),
                style: TextStyle(
                  color: logoutColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        backgroundColor:
                            isDarkMode ? const Color(0xFF363636) : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Text(
                          "log_out".tr(),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          "log_out_confirm".tr(),
                          style: TextStyle(color: secondaryTextColor),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "cancel".tr(),
                              style: TextStyle(
                                color:
                                    isDarkMode
                                        ? const Color(0xFF8687E7)
                                        : Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 40),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: logoutColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "log_out".tr(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                );
              },
=======
            // Settings section
            _buildSectionTitle("Settings"),
            _buildMenuTile(Icons.settings, "App Settings", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            }),
            const SizedBox(height: 24),

            // Account section
            _buildSectionTitle("Account"),
            _buildMenuTile(Icons.person_outline, "Change account name", () {
              _showChangeNameDialog(context);
            }),
            _buildMenuTile(Icons.image_outlined, "Change account Image", () {
              _showChangeImageBottomSheet(context);
            }),
            const SizedBox(height: 24),

            // Logout
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
            ),
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildStatBox(String text, Color backgroundColor, Color textColor) {
=======
  Widget _buildStatBox(String text) {
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
<<<<<<< HEAD
          color: backgroundColor,
=======
          color: const Color(0xFF272727),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
<<<<<<< HEAD
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
=======
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildSectionTitle(
    String title,
    Color textColor, {
    TextAlign? textAlign,
  }) {
    final arabicRegex = RegExp(r'^[\u0600-\u06FF]');
    final isArabic = title.isNotEmpty && arabicRegex.hasMatch(title[0]);

    final effectiveTextAlign =
        textAlign ?? (isArabic ? TextAlign.right : TextAlign.left);
    final effectiveAlign =
        isArabic ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: effectiveAlign,
      child: Text(
        title,
        textAlign: effectiveTextAlign,
        style: TextStyle(
          color: textColor,
=======
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildMenuTile(
    IconData icon,
    String title,
    VoidCallback onTap,
    Color textColor,
    Color iconColor,
  ) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: iconColor.withOpacity(0.7),
=======
  Widget _buildMenuTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white54,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
        size: 16,
      ),
      onTap: onTap,
    );
  }

<<<<<<< HEAD
  void _showChangeNameDialog(BuildContext context, bool isDarkMode) {
    final nameCubit = context.read<UserNameCubit>();
    final TextEditingController nameController = TextEditingController(
      text: nameCubit.state,
=======
  void _showChangeNameDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController(
      text: "Fahad",
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
    );

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
<<<<<<< HEAD
          backgroundColor: isDarkMode ? const Color(0xFF363636) : Colors.white,
=======
          backgroundColor: const Color(0xFF363636),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
<<<<<<< HEAD
                Text(
                  "change_account_name".tr(),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
=======
                // Dialog Title
                const Text(
                  "Change account name",
                  style: TextStyle(
                    color: Colors.white,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
<<<<<<< HEAD
                  color:
                      isDarkMode
                          ? const Color(0xFF979797)
                          : Colors.grey.shade400,
                  height: 24,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        isDarkMode
                            ? const Color(0xFF363636)
                            : Colors.grey.shade100,
                    hintText: "enter_new_name".tr(),
                    hintStyle: TextStyle(
                      color: isDarkMode ? Colors.grey : Colors.grey.shade600,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color:
                            isDarkMode
                                ? const Color(0xFF979797)
                                : Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: isDarkMode ? Colors.blue : Colors.blue,
                      ),
=======
                  color: Color(0xFF979797),
                  height: 24,
                  thickness: 1,
                ),
                const SizedBox(height: 16),

                // Text Field
                TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF363636),
                    hintText: "Enter new name",
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                      
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF979797)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.blue),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                    ),
                  ),
                ),
                const SizedBox(height: 16),
<<<<<<< HEAD
=======

                // Buttons (Cancel and Edit)
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
<<<<<<< HEAD
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "cancel".tr(),
                        style: TextStyle(
                          color:
                              isDarkMode
                                  ? const Color(0xFF8687E7)
                                  : Colors.blue,
=======
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xFF8687E7),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 153,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
<<<<<<< HEAD
                          final newName = nameController.text.trim();
                          if (newName.isNotEmpty) {
                            nameCubit.updateName(newName);
                          }
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isDarkMode
                                  ? const Color(0xFF8687E7)
                                  : Colors.blue,
=======
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8687E7),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
<<<<<<< HEAD
                        child: Text(
                          "edit".tr(),
                          style: const TextStyle(
=======
                        child: const Text(
                          "Edit",
                          style: TextStyle(
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
<<<<<<< HEAD

  void _showChangeImageBottomSheet(BuildContext context, bool isDarkMode) {
    final imageCubit = context.read<ProfileImageCubit>();

    showModalBottomSheet(
      context: context,
      backgroundColor: isDarkMode ? const Color(0xFF363636) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Wrap(
            runSpacing: 12,
            children: [
              ListTile(
                leading: Icon(
                  Icons.camera_alt_outlined,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
                title: Text(
                  "take_picture".tr(),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                onTap: () {
                  imageCubit.pickFromCamera();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library_outlined,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
                title: Text(
                  "import_from_gallery".tr(),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                onTap: () {
                  imageCubit.pickFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel_outlined, color: Colors.redAccent),
                title: Text(
                  "cancel".tr(),
                  style: const TextStyle(color: Colors.redAccent),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
=======
  void _showChangeImageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    backgroundColor: const Color(0xFF363636),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            const Text(
              "Change account Image",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Color(0xFF979797),
              thickness: 1,
              height: 24,
            ),

            // Option 1: Take Picture
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: const Text(
                "Take picture",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle taking picture logic
                Navigator.pop(context);
              },
            ),

            // Option 2: Import from Gallery
            ListTile(
              leading: const Icon(Icons.photo, color: Colors.white),
              title: const Text(
                "Import from gallery",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle importing from gallery logic
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
}
