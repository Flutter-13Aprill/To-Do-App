// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todoapp_darkmode/theme/style/app_colors.dart';
// import 'package:todoapp_darkmode/theme/style/app_fonts.dart';
// import 'bloc/add_task_bloc.dart';

// void showTimePickerDialog(BuildContext outerContext) {
//   int selectedHour = 8;
//   int selectedMinute = 0;
//   String selectedPeriod = 'AM';

//   showDialog(
//     context: outerContext,
//     builder: (ctx) {
//       return AlertDialog(
//         backgroundColor: AppColors.grey,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         contentPadding: const EdgeInsets.all(16),
//         content: StatefulBuilder(
//           builder: (context, setModalState) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text("Choose Time", style: AppFonts.fontSizeThree),
//                 const SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _timeBox(
//                       "${selectedHour.toString().padLeft(2, '0')}",
//                       () => setModalState(() {
//                         selectedHour = (selectedHour + 1) % 13;
//                         if (selectedHour == 0) selectedHour = 1;
//                       }),
//                     ),
//                     const SizedBox(width: 8),
//                     const Text(":", style: TextStyle(color: Colors.white, fontSize: 18)),
//                     const SizedBox(width: 8),
//                     _timeBox(
//                       "${selectedMinute.toString().padLeft(2, '0')}",
//                       () => setModalState(() {
//                         selectedMinute = (selectedMinute + 1) % 60;
//                       }),
//                     ),
//                     const SizedBox(width: 8),
//                     _timeBox(
//                       selectedPeriod,
//                       () => setModalState(() {
//                         selectedPeriod = selectedPeriod == 'AM' ? 'PM' : 'AM';
//                       }),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     final time = TimeOfDay(
//                       hour: selectedPeriod == 'AM'
//                           ? selectedHour % 12
//                           : (selectedHour % 12) + 12,
//                       minute: selectedMinute,
//                     );

//                     // Use outerContext instead of dialog context
//                     outerContext.read<AddTaskBloc>().add(TimePicked(time));
//                     Navigator.pop(outerContext);
//                     print(" Time picked: ${time.format(outerContext)}");
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.lilac,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                   child: const Text("Save"),
//                 ),
//               ],
//             );
//           },
//         ),
//       );
//     },
//   );
// }



// Widget _timeBox(String value, VoidCallback onTap) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width: 64,
//       height: 64,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: AppColors.darkgrey,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
//     ),
//   );
// }
