// lib/main.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/index/categories/categories_grid.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class CategoriesScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  IconData? _selectedIcon;
  final Color _selectedColor = Color(0xFFE6EE9C);

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        final bloc = context.read<IndexBloc>();
        final categories = bloc.categories.categories;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr("CategoryScreen.title"),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      context.tr("CategoryScreen.categoryName"),
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Category name',
                        hintStyle: TextStyle(color: mainText),
                        filled: true,
                        fillColor: containerColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: borderColor,
                            width: 0.8,
                          ),
                        ),
                      ),
                      onChanged: (val) {},
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Category Icon Picker (stubbed)
                    Text(
                      context.tr("CategoryScreen.categoryIconTitle"),
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: containerColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () async {
                        _selectedIcon = await showDialog(
                          context: context,
                          builder: (context) {
                            return BlocProvider.value(
                              value: bloc,
                              child: CategoriesGrid(),
                            );
                          },
                        );
                      },
                      child: _selectedIcon == null
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                context.tr("CategoryScreen.categoryIconButton"),
                                style: TextStyle(color: mainText),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Icon(_selectedIcon),
                            ),
                    ),
                    const SizedBox(height: 24),

                    // Category Color Picker
                    const Text(
                      'Category color :',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: context.screenWidth * 0.8,
                      height: 48,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: categories[index].backgroundColor,
                                  shape: BoxShape.circle,
                                  border:
                                      (categories[index].backgroundColor ==
                                          _selectedColor)
                                      ? Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const Spacer(),

                    // Bottom Buttons: Cancel / Create Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7E57C2),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Create Category',
                            style: TextStyle(fontSize: 16, color: mainText),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
