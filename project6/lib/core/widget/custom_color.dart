import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/feature/home/data/model/category/category_data.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';

class CustomColor extends StatelessWidget {
  const CustomColor({super.key});

  @override
  Widget build(BuildContext context) {
    final currentColor = CategoryData.categoryColor;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: currentColor.length,
          itemBuilder: (BuildContext context, int index) {
            final selectedColor = state is ColorCategoryState
                ? state.color
                : null;
            final isSelectedColor = currentColor[index] == selectedColor;
            return InkWell(
              onTap: () {
                bloc.add(
                  ColorSelectedEvent(
                    colorSelect: CategoryData.categoryColor[index],
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: CategoryData.categoryColor[index],
                        shape: BoxShape.circle,
                      ),
                      child: isSelectedColor
                          ? Icon(
                              Icons.check,
                              size: 35,
                              color: AppPalette.whiteColor,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
