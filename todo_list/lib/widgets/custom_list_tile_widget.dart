import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/style/app_colors.dart';

class CustomListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;
  final bool trailing;
  const CustomListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color = AppColors.whiteTransparent,
    this.trailing = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: trailing ? null : onTap,
      contentPadding: EdgeInsets.all(0),
      leading: Icon(icon, color: color),
      title: Text(title.tr(), style: TextStyle(color: color)),
      trailing:
          trailing
              ? InkWell(
                onTap: onTap,

                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.whiteTransparent,
                ),
              )
              : null,
    );
  }
}
