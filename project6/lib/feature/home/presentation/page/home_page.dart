import 'package:flutter/material.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.index),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
        actions: [
          CircleAvatar(child: Image.asset("asset/image/onboarding2.png")),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("asset/image/onboarding2.png"),
            SizedBox(height: 10),
            Text(AppText.doToday, style: TextStyles.lato40020),
            SizedBox(height: 10),
            Text(AppText.doTodaySubtitle, style: TextStyles.lato40016),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
