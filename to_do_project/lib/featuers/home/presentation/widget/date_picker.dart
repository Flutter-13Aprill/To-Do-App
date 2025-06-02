// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:to_do_project/featuers/home/bloc/home_bloc.dart';

// class AddTaskSheet extends StatelessWidget {
//   const AddTaskSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => HomeBloc(),
//       child: const _AddTaskContent(),
//     );
//   }
// }

// class _AddTaskContent extends StatelessWidget {
//   const _AddTaskContent();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeBloc, HomeState>(
//       listener: (context, state) {
//         if (state is TaskSavedSuccess) {
//           Navigator.pop(context);
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Task added successfully")),
//           );
//         }
//       },
//       builder: (context, state) {
//         final bloc = context.read<HomeBloc>();
//         return Container(
//           padding: const EdgeInsets.all(24),
//           decoration: const BoxDecoration(
//             color: Color(0xFF1D1D1D),
//             borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Add Task',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   onChanged: (val) => bloc.add(TitleChanged(val)),
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     hintText: 'Do math homework',
//                     hintStyle: const TextStyle(color: Colors.white30),
//                     filled: true,
//                     fillColor: const Color(0xFF121212),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 TextField(
//                   onChanged: (val) => bloc.add(DescriptionChanged(val)),
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     hintText: 'Do chapter 2 to 5 for next week',
//                     hintStyle: const TextStyle(color: Colors.white30),
//                     filled: true,
//                     fillColor: const Color(0xFF121212),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.calendar_today,
//                         color: Colors.white,
//                       ),
//                       onPressed: () async {
//                         final now = DateTime.now();
//                         final picked = await showDatePicker(
//                           context: context,
//                           initialDate: now,
//                           firstDate: now,
//                           lastDate: DateTime(now.year + 2),
//                           builder: (context, child) => Theme(
//                             data: Theme.of(context).copyWith(
//                               colorScheme: const ColorScheme.dark(
//                                 primary: Color(0xFF8687E7),
//                                 onPrimary: Colors.white,
//                                 surface: Color(0xFF1D1D1D),
//                                 onSurface: Colors.white,
//                               ),
//                               dialogBackgroundColor: const Color(0xFF121212),
//                             ),
//                             child: child!,
//                           ),
//                         );
//                         if (picked != null) bloc.add(DateChanged(picked));
//                       },
//                     ),
//                     if (state.date != null)
//                       Text(
//                         DateFormat.yMMMd().format(state.date!),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     IconButton(
//                       icon: const Icon(Icons.access_time, color: Colors.white),
//                       onPressed: () async {
//                         final picked = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                           builder: (context, child) => Theme(
//                             data: Theme.of(context).copyWith(
//                               colorScheme: const ColorScheme.dark(
//                                 primary: Color(0xFF8687E7),
//                                 onPrimary: Colors.white,
//                                 surface: Color(0xFF1D1D1D),
//                                 onSurface: Colors.white,
//                               ),
//                               dialogBackgroundColor: const Color(0xFF121212),
//                             ),
//                             child: child!,
//                           ),
//                         );
//                         if (picked != null) bloc.add(TimeChanged(picked));
//                       },
//                     ),
//                     if (state.time != null)
//                       Text(
//                         state.time!.format(context),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     IconButton(
//                       icon: const Icon(Icons.flag, color: Colors.white),
//                       onPressed: () {
//                         int temp = state.priority;
//                         showDialog(
//                           context: context,
//                           builder: (context) => StatefulBuilder(
//                             builder: (context, setState) => AlertDialog(
//                               backgroundColor: const Color(0xFF1D1D1D),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               title: const Text(
//                                 'Task Priority',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               content: Wrap(
//                                 spacing: 12,
//                                 runSpacing: 12,
//                                 children: List.generate(10, (index) {
//                                   final val = index + 1;
//                                   final selected = val == temp;
//                                   return GestureDetector(
//                                     onTap: () => setState(() => temp = val),
//                                     child: Container(
//                                       width: 48,
//                                       height: 48,
//                                       decoration: BoxDecoration(
//                                         color: selected
//                                             ? const Color(0xFF8687E7)
//                                             : const Color(0xFF2D2D2D),
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         '$val',
//                                         style: TextStyle(
//                                           color: selected
//                                               ? Colors.white
//                                               : Colors.white70,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                               ),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () => Navigator.pop(context),
//                                   child: const Text(
//                                     'Cancel',
//                                     style: TextStyle(color: Colors.white54),
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     bloc.add(PriorityChanged(temp));
//                                     Navigator.pop(context);
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xFF8687E7),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                   ),
//                                   child: const Text('Save'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     const Spacer(),
//                     IconButton(
//                       icon: const Icon(Icons.send, color: Color(0xFF8687E7)),
//                       onPressed: () {
//                         bloc.add(TaskSubmitted());
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
