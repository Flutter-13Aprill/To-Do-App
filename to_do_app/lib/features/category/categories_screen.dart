import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/category/bloc/categories_bloc.dart';


class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final List<Color> colors = [
    Color.fromARGB(255, 211, 224, 22),
    Color.fromARGB(255, 72, 177, 76),
    Color.fromARGB(255, 32, 225, 177),
    Color.fromARGB(255, 65, 161, 239),
    Color.fromARGB(255, 4, 161, 234),
    Color.fromARGB(255, 242, 159, 34),
    Color.fromARGB(255, 165, 68, 182),
    Color.fromARGB(255, 217, 28, 91),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          title: const Text('Create new category'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<CategoriesBloc, CategoriesState>(
            listener: (context, state) {
              if (state.submitted &&
                  state.name.isNotEmpty &&
                  state.color != null &&
                  state.icon != null) {
                Navigator.pop(context, {
                  "name": state.name,
                  "color": state.color,
                  "icon": state.icon,
                });
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category name :',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      context
                          .read<CategoriesBloc>()
                          .add(CategoryNameChanged(value));
                    },
                    decoration: InputDecoration(
                      hintText: 'Category name',
                      hintStyle: const TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white54),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Category icon :',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async{
  final selectedIcon = await showDialog<IconData>(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Choose icon",style: TextStyle(color: AppPalette.backgroundColor),),
      content: Wrap(
        spacing: 10,
        children: availableIcons.map((icon) {
          return IconButton(
            icon: Icon(icon),
            onPressed: () {
              Navigator.pop(context, icon); 
            },
          );
        }).toList(),
      ),
    ),
  );

  if (selectedIcon != null) {
    if(!context.mounted )return;
    context.read<CategoriesBloc>().add(CategoryIconChanged(selectedIcon));
  }
},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                    ),
                    child: const Text("Choose icon from library"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Category color :',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    children: colors.map((color) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<CategoriesBloc>()
                              .add(CategoryColorChanged(color));
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: color,
                          child: state.color == color
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 16)
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.deepPurpleAccent),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<CategoriesBloc>()
                              .add(SubmitCategory());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                        child: const Text('Create Category'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
final List<IconData> availableIcons = [
  Icons.home,
  Icons.star,
  Icons.work,
  Icons.shopping_cart,
  Icons.fastfood,
  Icons.favorite,
  Icons.book,
  Icons.music_note,
];
