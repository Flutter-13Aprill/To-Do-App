import 'package:flutter/material.dart';
import 'package:to_do_list/layers/AppModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/screens/home/index/bloc/index_bloc.dart';
import 'package:to_do_list/widgets/bottom_sheet_container.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<IndexBloc>();
          return Scaffold(
            body: BlocBuilder<IndexBloc, IndexState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: bloc.layedData.tasks.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.amber),
                            child: ListTile(
                              leading: Checkbox(
                                value: bloc.isChecked,
                                onChanged: (newValue) =>
                                    bloc.isChecked = newValue!,
                              ),
                              title: Text(bloc.layedData.tasks[index].taskName),
                              subtitle: Text(
                                bloc.layedData.tasks[index].dueDate,
                              ),
                              trailing: Text("Priority"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

  // AppModelLayer().tasks.isEmpty
                      //     ? Column(
                      //         children: [
                      //           Image.asset("assets/images/home/MainPage.png"),
                      //           Text(
                      //             "What do you want to do today?",
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //           Text(
                      //             "Tap + to add your tasks",
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //           FloatingActionButton(
                      //             onPressed: () {
                      //               showModalBottomSheet(
                      //                 context: context,
                      //                 builder: (context) => BottomSheetContainer(),
                      //               );
                      //             },
                      //             child: Text("+"),
                      //           ),
                      //         ],
                      //       )
