// import 'package:flutter/material.dart';
// import 'package:project7/screen/intro2_screen.dart';
// import 'package:project7/screen/splash_screen.dart';

// class ButtonWidget extends StatelessWidget {
//   const ButtonWidget({
//     super.key,

//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(width: 20),
//         SizedBox(
//           height: 48,
//           width: 90,

//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               backgroundColor: Color.fromARGB(0, 135, 117, 255),
//             ),

//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SplashScreen()),
//               );
//             },
//             child: Text(
//               "Back",
//               style: TextStyle(
//                 color: const Color.fromARGB(60, 255, 255, 255),
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 200),
//         SizedBox(
//           height: 48,
//           width: 90,

//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               backgroundColor: Color.fromARGB(255, 136, 117, 255),
//             ),

//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Intro2Screen()),
//               );
//             },

//             child: Text(
//               "Next",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
