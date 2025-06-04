import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/models/category_model.dart';
import 'package:project6/screens/home/bloc/home_bloc.dart';
import 'package:project6/screens/new_catagory_screen.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/catagory_container.dart';

class CatagoryAlert extends StatelessWidget {
  const CatagoryAlert({super.key, this.onTap, required this.cata});

  final CategoryModel Function()? onTap;
  final List<CategoryModel> cata;

  @override
  Widget build(BuildContext context) {

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
                'chooseCat'.tr(),
                style: context.bodyM()!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 310.w,
                child: Divider(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(height: 8.h),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 2.2,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: cata.length,
                  itemBuilder: (context, index) {
                    return BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        final bloc = context.read<HomeBloc>();
                        return CatagoryContainer(
                          setCatagory: cata[index].category,
                          setImage: Image.asset(cata[index].icon),
                          setColor: cata[index].color,
                          onTap: () {
                            bloc.catagory = cata[index];
                            
                            if(cata[index].category == 'Create New')
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewCatagoryScreen()));
                            }
                            print(bloc.catagory.category);
                          },
                        );
                      },
                    );
                  },
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
                    Navigator.pop(context);
                  },
                  child: Text('addCat'.tr(), style: context.bodyM()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


