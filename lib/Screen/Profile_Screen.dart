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
            ),

            const SizedBox(height: 24),

            // Task counters
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ],
            ),

            const SizedBox(height: 32),

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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String text, Color backgroundColor, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

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
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

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
        size: 16,
      ),
      onTap: onTap,
    );
  }

  void _showChangeNameDialog(BuildContext context, bool isDarkMode) {
    final nameCubit = context.read<UserNameCubit>();
    final TextEditingController nameController = TextEditingController(
      text: nameCubit.state,
    );

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: isDarkMode ? const Color(0xFF363636) : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "change_account_name".tr(),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
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
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "cancel".tr(),
                        style: TextStyle(
                          color:
                              isDarkMode
                                  ? const Color(0xFF8687E7)
                                  : Colors.blue,
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          "edit".tr(),
                          style: const TextStyle(
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
}
