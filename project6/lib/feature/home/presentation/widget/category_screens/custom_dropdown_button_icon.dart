import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/git_size_screen.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/feature/home/data/model/category/category_data.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';

class CustomDropdownButtonIcon extends StatelessWidget {
  const CustomDropdownButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        return SizedBox(
          width: context.getWidth() * 0.45,
          child: DropdownButtonFormField(
            items: CategoryData.categoryIcons
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Icon(
                      item,
                      color: bloc.selectedColor ?? AppPalette.whiteColor,
                      size: 35,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              bloc.add(IconSelectedEvent(iconSelect: value!));
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppPalette.lightGray,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            dropdownColor: AppPalette.lightBlack2,
            isExpanded: false,
            isDense: true,
            value: bloc.selectedIcon,
            hint: Text(AppText.library, style: TextStyles.lato40012),
          ),
        );
      },
    );
  }
}
