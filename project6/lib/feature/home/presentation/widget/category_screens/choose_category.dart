import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/git_size_screen.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>()..add(LoadCategoriesEvent());
        return SizedBox(
          height: context.getHeight() * 0.30,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: bloc.categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      color: bloc.categories[index].categoryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(bloc.categories[index].categoryIcon),
                  ),
                  Text(
                    bloc.categories[index].categoryName,
                    style: TextStyles.lato40016,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
