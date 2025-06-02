import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/home/bloc/home_bloc.dart';
import 'package:project6/screens/new_catagory_screen.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/catagory_container.dart';

class CatagoryAlert extends StatelessWidget {
  const CatagoryAlert({super.key, this.onTap, required this.cata});

  final Function()? onTap;
  final List<Widget> cata;

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<HomeBloc>();
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: Builder(
        builder: (context) {
          return UnconstrainedBox(
            child: Container(
              width: 327.w,
              height: 556.h,
              color: AppColors().alertBackgroundColor,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8.h),
                    Text(
                      textAlign: TextAlign.center,
                      'Choose Catagory',
                      style: context.bodyM()!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 310.w,
                      child: Divider(
                        color: const Color.fromARGB(255, 151, 151, 151),
                      ),
                    ),
                    SizedBox(height: 8.h),
          
                    Expanded(
                      child: GridView.count(
                        childAspectRatio: 2 / 2.2,
                        crossAxisSpacing: 8,
                        crossAxisCount: 3,
                        children: [
                         ...cata
                        ],
                      ),
                    ),
                    Container(
                      width: 289.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: AppColors().buttonColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextButton(
                        onPressed: () {
                          //                     Navigator.pop(context,BlocProvider.value(value: bloc,)
                          // );
                        },
                        child: Text('Add Catagory', style: context.bodyM()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}


//  CatagoryContainer(
//                             onTap: () {
//                               context.read<HomeBloc>().catagory = 'hello';
//                               print(context.read<HomeBloc>().catagory);
//                             },
//                             setCatagory: 'Grocery',
//                             setImage:'assets/icons/grocery.png',
//                             setColor: const Color.fromARGB(255, 204, 255, 128),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
//                             setCatagory: 'Work',
//                             setImage: 'assets/icons/work.png',
//                             setColor: const Color.fromARGB(255, 255, 150, 128),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
          
//                             setCatagory: 'Sport',
//                             setImage: 'assets/icons/sport.png',
//                             setColor: const Color.fromARGB(255, 128, 255, 255),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
          
//                             setCatagory: 'Design',
//                             setImage: 'assets/icons/sony.png',
//                             setColor: const Color.fromARGB(255, 128, 255, 217),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
          
//                             setCatagory: 'University',
//                             setImage: 'assets/icons/graduate.png',
//                             setColor: const Color.fromARGB(255, 128, 156, 255),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
          
//                             setCatagory: 'Social',
//                             setImage: 'assets/icons/microphone.png',
//                             setColor: const Color.fromARGB(255, 255, 128, 235),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
          
//                             setCatagory: 'Music',
//                             setImage: 'assets/icons/music.png',
//                             setColor: const Color.fromARGB(255, 252, 128, 255),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
          
//                             setCatagory: 'Health',
//                             setImage: 'assets/icons/heartbeat.png',
//                             setColor: const Color.fromARGB(255, 128, 255, 163),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
          
//                             setCatagory: 'Movie',
//                             setImage: 'assets/icons/video.png',
//                             setColor: const Color.fromARGB(255, 128, 209, 255),
//                           ),
//                           CatagoryContainer(
//                             onTap: onTap,
//                             setCatagory: 'Home',
//                             setImage: 'assets/icons/home2.png',
//                             setColor: const Color.fromARGB(255, 255, 204, 128),
//                           ),
//                           CatagoryContainer(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => NewCatagoryScreen(),
//                                 ),
//                               );
//                             },
//                             setCatagory: 'Create New',
//                             setImage: 'assets/icons/plus.png',
//                             setColor: const Color.fromARGB(255, 128, 255, 209),
//                           ),