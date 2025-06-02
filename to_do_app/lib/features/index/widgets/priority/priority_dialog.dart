import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/index/widgets/priority/bloc/priority_bloc.dart';

class PriorityDialog extends StatelessWidget {
  final int? initialPriority;

  const PriorityDialog({super.key, this.initialPriority});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PriorityBloc>(context);

    
    if (initialPriority != null && bloc.state.selectedPriority != initialPriority) {
      bloc.add(SelectPriority(initialPriority!));
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFF2C2C2C),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Task Priority',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            BlocBuilder<PriorityBloc, PriorityState>(
              builder: (context, state) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final number = index + 1;
                    final isSelected = state.selectedPriority == number;

                    return GestureDetector(
                      onTap: () {
                        bloc.add(SelectPriority(number));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF9F8CF9)
                              : const Color(0xFF3C3C3C),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.flag_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$number',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, null),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9F8CF9),
                  ),
                  onPressed: () {
                    final selected = bloc.state.selectedPriority;
                    Navigator.pop(context, selected);
                  },
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
