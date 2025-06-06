import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/style/app_colors.dart';

class SettingsListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool switchValue;
  final ValueChanged<bool> onChanged;

  const SettingsListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.switchValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.whiteTransparent),
      title: Text(
        title.tr(),
        style: TextStyle(color: AppColors.whiteTransparent),
      ),
      trailing: Switch(value: switchValue, onChanged: onChanged),
    );
  }
}
