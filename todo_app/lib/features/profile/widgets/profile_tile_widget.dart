import 'package:flutter/material.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key,
    required this.title,
    required this.icon,
    this.iconTrailing,
    required this.style,
    this.iconColor,
    this.onTap,
  });
  final Function()? onTap;
  final String title;
  final IconData? icon;
  final Widget? iconTrailing;
  final TextStyle style;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.transparent,
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: style),
      trailing: iconTrailing,
    );
  }
}
