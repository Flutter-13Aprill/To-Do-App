import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/profile/screen/bloc/profile_bloc.dart';
import 'package:todoapp/profile/widget/row_setteing.dart';
import 'package:todoapp/theems/colors.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ProfileBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Settings",
                style: TextStyle(color: MyAppColor.white),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: MyAppColor.white,
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text("Settings", style: TextStyle(color: MyAppColor.gray)),
                    SizedBox(height: 18),
                    RowSetteing(
                      iconprofile: Icons.draw_outlined,
                      text: 'Change app color',
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        bloc.add(changelanguage(locale: Locale('ar', 'AR')));
                      },
                      child: RowSetteing(
                        iconprofile: Icons.translate,
                        text: "Change app language",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
