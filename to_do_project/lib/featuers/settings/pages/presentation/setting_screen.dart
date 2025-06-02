import 'package:flutter/material.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/featuers/settings/pages/widget/custom_list_view.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalete.background,
      appBar: AppBar(
        backgroundColor: AppPalete.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppPalete.text),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: TextStyles.lato400s16.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppPalete.text,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListViewS(
              title: 'Settings',
              children: [
                ListTile(
                  leading: Icon(Icons.palette, color: AppPalete.text),
                  title: Text(
                    'Change app color',
                    style: TextStyles.lato400s16.copyWith(
                      color: AppPalete.text,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppPalete.text,
                  ),
                  onTap: () {
                    print('Change app color tapped');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language, color: AppPalete.text),
                  title: Text(
                    'Change app language',
                    style: TextStyles.lato400s16.copyWith(
                      color: AppPalete.text,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppPalete.text,
                  ),
                  onTap: () {
                    print('Change app language tapped');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
