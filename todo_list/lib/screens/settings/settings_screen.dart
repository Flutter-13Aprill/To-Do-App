import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/settings/bloc/settings_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/widgets/settings_list_tile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);

    bool isEnable = currentLocale.languageCode == 'en';
    return BlocProvider(
      create: (context) => SettingsBloc(isEnable: isEnable),
      child: Builder(
        builder: (context) {
          final bloc = context.read<SettingsBloc>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "settings".tr(),
                style: TextStyle(color: AppColors.whiteTransparent),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "settings".tr(),
                      style: TextStyle(color: AppColors.whiteTransparent),
                    ),
                    BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return SettingsListTileWidget(
                          icon: Icons.brush_outlined,
                          title: "dark_mode",
                          switchValue: true,
                          onChanged: (val) {},
                        );
                      },
                    ),

                    BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return SettingsListTileWidget(
                          icon: Icons.g_translate_sharp,
                          title: "english_language",
                          switchValue: bloc.isEnable,
                          onChanged: (val) {
                            final currentLocale = context.locale;
                            final newLocale =
                                currentLocale.languageCode == 'en'
                                    ? Locale('ar', 'AR')
                                    : Locale('en', 'US');
                            context.setLocale(newLocale);
                            bloc.add(ChangeLanguageEvent());
                          },
                        );
                      },
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
