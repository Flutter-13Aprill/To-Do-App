import 'package:flutter/material.dart';
import 'package:to_do_project/widgets/custom_profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Setting', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Column(
        children: [
          CustomProfile(
            text: 'Change app color',
            icon: Icon(Icons.brush_outlined),
          ),
          Divider(color: Colors.grey, thickness: 0.3),
          CustomProfile(
            text: 'Change app language',
            icon: Icon(Icons.translate_outlined),
          ),
        ],
      ),
    );
  }
}
