import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';
import 'package:project6/feature/home/presentation/widget/custom_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<HomeBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text(AppText.index),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_list),
              ),
              actions: [
                CircleAvatar(
                  radius: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("asset/image/profile.png"),
                  ),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 227,
                    width: 227,
                    child: Image.asset(
                      "asset/image/Checklist-rafiki 1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(AppText.doToday, style: TextStyles.lato40020),
                  SizedBox(height: 10),
                  Text(AppText.doTodaySubtitle, style: TextStyles.lato40016),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                CustomBottomSheet.show(context);
                // builder:
                // (context) => CustomBottomSheet();
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
