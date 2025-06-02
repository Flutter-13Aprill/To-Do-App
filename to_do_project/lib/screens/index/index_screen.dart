import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/screens/index/bloc/index_bloc.dart';
import 'package:to_do_project/style/color_theme.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<IndexBloc>();
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/index.png'),
                  Text(
                    'What do you want to do today?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Tap + to add your tasks',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        // backgroundColor: Colors.white,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Add task',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    labelText: 'Task name',
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    labelText: 'Description',
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.access_time_rounded,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.price_change_outlined,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.flag_outlined,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
          
                    backgroundColor: AppColors.primaryColor,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
