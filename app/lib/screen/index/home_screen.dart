import 'dart:developer';

import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/model/task/task.dart';
import 'package:app/screen/auth/login_and_register/widget/texfekd/textfeild.dart';
import 'package:app/screen/index/bloc/add_task_bloc.dart';
import 'package:app/screen/index/widget/container/Container_flag.dart';
import 'package:app/screen/index/widget/container/color_Container.dart';
import 'package:app/screen/index/widget/container/icon_container.dart';
import 'package:app/screen/index/widget/listtile/task_littile.dart';
import 'package:app/screen/nav/bloc/nav_bloc.dart';
import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  showSheet(BuildContext context) {
    final bloc = context.read<AddTaskBloc>();
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          color: StyleColor.primaryBlackColor,
          height: context.getHeigth() * .4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment(-0.95, -.5),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Add Task".tr(),
                    style: TextStyle(
                      color: StyleColor.primaryWhitelColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: bloc.taskController,
                    decoration: InputDecoration(hintText: "Do math homework"),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.95, -.5),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Description".tr(),
                    style: TextStyle(
                      color: StyleColor.primaryWhitelColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: bloc.descriptionController,
                    decoration: InputDecoration(
                      hintText: "Do math homework".tr(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDitePicker(context);
                    });
                  },
                  child: Text("add".tr()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showDitePicker(BuildContext context) {
    final bloc = context.read<AddTaskBloc>();

    showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      confirmText: "Choose Time".tr(),
    ).then((val) async {
      bloc.datePiked = val!;
      await showTimPiker(context);
    });

    log(bloc.datePiked.toString());
  }

  Future<void> showTimPiker(BuildContext context) async {
    final bloc = context.read<AddTaskBloc>();

    TimeOfDay? timeNew = await showTimePicker(
      // <-- هنا تم إضافة "await"
      context: context,
      initialTime: bloc.time,
    );

    // هنا يمكنك الآن استخدام timeNew بعد أن حصلت على القيمة
    if (timeNew != null) {
      log('Selected time: ${timeNew.format(context)}');
      bloc.time = timeNew;
      await taskPriorityDialog(context);
    } else {
      log('Time picker cancelled');
    }
  }

  Future<void> taskPriorityDialog(BuildContext context) async {
    // 1. احصلي على الـ Bloc الموجود بالفعل من الـ `context` الأصلي
    final existingBloc = context
        .read<AddTaskBloc>(); // <--- هذا هو السطر الأساسي الجديد

    await showDialog<void>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext dialogContext) {
        // 2. قومي بتوفير الـ Bloc الموجود (existingBloc) للـ Dialog
        return BlocProvider.value(
          // <--- استخدمي BlocProvider.value
          value: existingBloc, // <--- ومرري الـ Bloc الذي حصلتِ عليه
          child: BlocBuilder<AddTaskBloc, AddTaskState>(
            builder: (context, state) {
              // الآن، الـ `context` هنا (داخل هذا الـ builder) لديه وصول إلى الـ Bloc
              // لا حاجة لـ `final bloc = context.read<AddTaskBloc>();` هنا إذا كنت تستخدمين `state` و `context.read` مباشرة.
              // لكن بما أنك تستخدمين `bloc.currentPriority`، يجب أن يكون `currentPriority`
              // إما جزءًا من الـ `state` أو يتم تخزينه في الـ `Bloc` نفسه (وهو ما تقومين به).
              // إذا كان `currentPriority` موجودًا في الـ Bloc، فـ `final bloc = context.read<AddTaskBloc>();` صحيحة.

              final bloc = context
                  .read<AddTaskBloc>(); // يمكنك الاحتفاظ بها هنا

              if (state is AddTaskInitial) {
                bloc.currentPriority = state.taskPriority;
              }

              return Dialog(
                backgroundColor: StyleColor.primaryBlackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Task Priority".tr(),
                        style: TextStyle(
                          color: StyleColor.primaryWhitelColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        color: StyleColor.primaryWhitelColor.withOpacity(0.3),
                      ),
                      const SizedBox(height: 10),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.0,
                            ),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final priorityNumber = index + 1;

                          return ContainerFlag(
                            number: priorityNumber,
                            isSelected:
                                bloc.currentPriority ==
                                priorityNumber, // <--- استخدام bloc.currentPriority
                            onTap: () {
                              bloc.add(
                                TaskPriorityUpdated(priority: priorityNumber),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel".tr(),
                              style: TextStyle(
                                color: StyleColor.primaryWhitelColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              bloc.add(AddTaskEventt());
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: StyleColor.primaryPurpulColor,
                              foregroundColor: StyleColor.primaryWhitelColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text("Save".tr()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  ////
  ///
  ///
  ///
  ///
  ///
  /////////////////////////////////////////////////////////////////////////////
  ///

  void createNweCatogry(BuildContext context) {
    final bloc = context.read<AddTaskBloc>();

    // ----------------------------------------------------
    // تم حذف: لم نعد بحاجة إلى هذه المتغيرات المؤقتة لأننا سنعتمد على حالة البلوك
    // IconData? tempSelectedIcon = bloc.selectedIcon;
    // Color? tempSelectedColor = bloc.selectedCategoryColor;
    // ----------------------------------------------------

    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: StyleColor.primaryBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 24.0,
          ),
          // ----------------------------------------------------
          // تم استبدال StatefulBuilder بـ BlocConsumer
          child: BlocConsumer<AddTaskBloc, AddTaskState>(
            bloc: bloc, // تحديد البلوك الذي نستمع إليه
            listener: (context, state) {
              // ******** بداية منطق الـ Listener ********
              if (state is CategoryCreatedSuccessfully) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Category '${state.categoryName}' created successfully!"
                          .tr(),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(dialogContext); // إغلاق الـ Dialog عند النجاح
              } else if (state is AddTaskError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              // ******** نهاية منطق الـ Listener ********
            },
            builder: (context, state) {
              // ******** بداية منطق الـ Builder ********
              // قراءة القيم مباشرة من الـ getters في البلوك
              final IconData? currentSelectedIcon = bloc.selectedIcon;
              final Color? currentSelectedColor = bloc.selectedCategoryColor;

              // تحديد حالة التحميل لتعطيل الأزرار أثناء المعالجة
              bool isLoading =
                  state
                      is AddTaskLoading; // أو CategoryCreationLoading إذا أضفتها كحالة منفصلة في الـ BLoC

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // العنوان
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Create new category".tr(),
                          style: TextStyle(
                            color: StyleColor.primaryWhitelColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // اسم الفئة
                      Text(
                        "Category name".tr(),
                        style: TextStyle(
                          color: StyleColor.primaryWhitelColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        onChanged: (value) {
                          bloc.add(CatogryNameEvent(name: value));
                        },
                        controller: bloc.CatogryNameController,
                        style: TextStyle(color: StyleColor.primaryWhitelColor),
                        decoration: InputDecoration(
                          hintText: "Category name".tr(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // أيقونة الفئة
                      Text(
                        "Category icon".tr(),
                        style: TextStyle(
                          color: StyleColor.primaryWhitelColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // زر اختيار الأيقونة
                      ElevatedButton(
                        // ----------------------------------------------------
                        // تم تعطيل الزر أثناء التحميل
                        onPressed: () async {
                          final IconData?
                          chosenIcon = await showDialog<IconData>(
                            context: context,
                            builder: (BuildContext iconDialogContext) {
                              // استخدام iconDialogContext منفصل
                              return AlertDialog(
                                backgroundColor: StyleColor.primaryBlackColor,
                                title: Text(
                                  "Choose an Icon".tr(),
                                  style: TextStyle(
                                    color: StyleColor.primaryWhitelColor,
                                  ),
                                ),
                                content: Container(
                                  width: double.maxFinite,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8,
                                        ),
                                    itemCount: bloc.availableIcons.length,
                                    itemBuilder: (ctx, index) {
                                      final icon = bloc.availableIcons[index];
                                      return IconContainer(
                                        icon: icon,
                                        backgroundColor:
                                            StyleColor.primaryDarkGreyColor,
                                        iconColor:
                                            StyleColor.primaryWhitelColor,

                                        // ----------------------------------------------------
                                        // استخدام الـ getter من البلوك مباشرة
                                        onTap: () {
                                          // bloc.add(
                                          //   CatogryIconEvent(
                                          //     iconName: icon, indexIcon: index,
                                          //   ),
                                          // );
                                          bloc.iconColor = index;
                                          bloc.selectedIcon = icon;
                                          Navigator.pop(
                                            iconDialogContext,
                                            icon,
                                          ); // ارجاع الأيقونة المختارة وإغلاق الـ Dialog
                                        },
                                      );
                                    },
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                        iconDialogContext,
                                      ); // استخدام iconDialogContext
                                    },
                                    child: Text(
                                      "Cancel".tr(),
                                      style: TextStyle(
                                        color: StyleColor.primaryWhitelColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: StyleColor.primaryDarkGreyColor,
                          foregroundColor: StyleColor.primaryWhitelColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // ----------------------------------------------------
                            // عرض الأيقونة المختارة من الـ getter في البلوك
                            Icon(currentSelectedIcon ?? Icons.folder, size: 24),
                            // ----------------------------------------------------
                            const SizedBox(width: 8),
                            Text("Choose icon from library".tr()),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // لون الفئة
                      Text(
                        "Category color".tr(),
                        style: TextStyle(
                          color: StyleColor.primaryWhitelColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: bloc.availableColors.map((color) {
                            bloc.count++;
                            return ColorContainer(
                              color: color,
                              // ----------------------------------------------------
                              // استخدام الـ getter من البلوك مباشرة
                              isSelected: currentSelectedColor == color,
                              // ----------------------------------------------------
                              // ----------------------------------------------------
                              // تم تعطيل النقر أثناء التحميل
                              onTap: () {
                                bloc.add(
                                  CatogryColorEvent(
                                    catogryColors: color,
                                    colorIndex: bloc.count,
                                  ),
                                );
                                // لا حاجة لـ setState هنا، BlocConsumer سيتولى إعادة البناء
                              },
                              // ----------------------------------------------------
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // أزرار الإجراءات
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // زر الإلغاء
                          Expanded(
                            child: OutlinedButton(
                              // ----------------------------------------------------
                              // تم تعطيل الزر أثناء التحميل
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                              // ----------------------------------------------------
                              style: OutlinedButton.styleFrom(
                                foregroundColor: StyleColor.primaryWhitelColor,
                                side: BorderSide(
                                  color: StyleColor.primaryGreyColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14.0,
                                ),
                              ),
                              child: Text("Cancel".tr()),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // زر إنشاء الفئة
                          Expanded(
                            child: ElevatedButton(
                              // ----------------------------------------------------
                              // تم تعطيل الزر أثناء التحميل
                              onPressed: () {
                                // ******** تم تبسيط المنطق لإرسال حدث واحد فقط ********
                                bloc.add(CreateNewCategoryEvent());
                                // الـ listener في BlocConsumer سيتعامل مع إغلاق الـ dialog وعرض الرسائل
                                // ----------------------------------------------------
                                // تم حذف المنطق القديم للتحقق من الفراغات وحفظ القيم وعرض SnackBar هنا
                                // لأنه تم نقله إلى الـ BLoC والـ listener
                                // final String categoryName = bloc.CatogryNameController.text.trim();
                                // if (categoryName.isNotEmpty && tempSelectedIcon != null && tempSelectedColor != null) {
                                //   bloc.category = categoryName;
                                //   bloc.color = tempSelectedColor!;
                                //   bloc.selectedIcon = tempSelectedIcon!;
                                //   log('New Category Created: Name: $categoryName, Icon: $tempSelectedIcon, Color: $tempSelectedColor');
                                //   Navigator.pop(dialogContext);
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(...);
                                // }
                                // ----------------------------------------------------
                              },
                              // ----------------------------------------------------
                              // إضافة مؤشر تحميل
                              child: Text("Create Category".tr()),
                              // ----------------------------------------------------
                              style: ElevatedButton.styleFrom(
                                backgroundColor: StyleColor.primaryPurpulColor,
                                foregroundColor: StyleColor.primaryWhitelColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // ----------------------------------------------------
        );
      },
    );
  }

  ///
  ///
  ///
  /////////////////////////////////////////////////////////////////////////////////////////////////

  chosseCatogry(BuildContext context) {
    final contex2 = context;
    final bloc = context.read<AddTaskBloc>();
    // قائمة الفئات والأيقونات (يمكنكِ تعديلها وإضافة المزيد)
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Grocery'.tr(),
        'icon': Icons.bakery_dining,
        'color': StyleColor.primaryLigthGreenColor,
      }, // لون أخضر فاتح
      {
        'name': 'Work'.tr(),
        'icon': Icons.work,
        'color': StyleColor.primaryLigthReadColor,
      }, // لون برتقالي
      {
        'name': 'Sport'.tr(),
        'icon': Icons.fitness_center,
        'color': StyleColor.primaryLigthGreen0xFF7AFFDCColor,
      }, // لون أزرق فاتح
      {
        'name': 'Design'.tr(),
        'icon': Icons.grid_view,
        'color': StyleColor.primaryLigthBlueColor,
      }, // أيقونة تقريبية، لون أزرق مخضر
      {
        'name': 'University'.tr(),
        'icon': Icons.school,
        'color': StyleColor.primaryPurpulColor,
      }, // لون بنفسجي/أزرق
      {
        'name': 'Social'.tr(),
        'icon': Icons.campaign,
        'color': StyleColor.primaryLigthPinkColor,
      }, // لون وردي
      {
        'name': 'Music'.tr(),
        'icon': Icons.music_note,
        'color': StyleColor.primaryLigthPink0xFFEF90FFColor,
      }, // لون بنفسجي
      {
        'name': 'Health'.tr(),
        'icon': Icons.monitor_heart,
        'color': StyleColor.primaryLigthGreen0xFF8FFFCDColor,
      }, // لون أخضر فاتح
      {
        'name': 'Movie'.tr(),
        'icon': Icons.videocam,
        'color': StyleColor.primaryPurpulColor,
      }, // لون أزرق
      {
        'name': 'Home'.tr(),
        'icon': Icons.home,
        'color': StyleColor.primaryLigthGooldColor,
      }, // لون بني/ذهبي
      {
        'name': 'Create New'.tr(),
        'icon': Icons.add,
        'color': StyleColor.primaryLigthGreen0xFF8FFFCDColor,
      }, // لون أخضر فاتح
    ];

    showDialog(
      context: context,
      builder: (dialogContext) {
        // استخدام dialogContext لتجنب التضارب
        return Dialog(
          // الشكل والألوان
          backgroundColor: StyleColor
              .primaryBlackColor, // لون خلفية الـ Dialog من StyleColor
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // حواف دائرية
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 24.0,
          ), // مسافة عن حواف الشاشة
          child: Padding(
            padding: const EdgeInsets.all(16.0), // مسافة داخلية للـ Dialog
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // يجعل العمود يأخذ أقل مساحة ممكنة
              children: [
                // العنوان
                Align(
                  alignment: Alignment.centerLeft, // لجعله يبدأ من اليسار
                  child: Text(
                    "Choose Category".tr(),
                    style: TextStyle(
                      color: StyleColor.primaryWhitelColor, // لون العنوان
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16), // مسافة بين العنوان والشبكة
                // الشبكة (GridView) للفئات
                GridView.builder(
                  shrinkWrap: true, // مهم جداً داخل Column
                  physics:
                      const NeverScrollableScrollPhysics(), // لمنع التمرير في الشبكة
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 أعمدة كما في الصورة
                    crossAxisSpacing: 10, // المسافة الأفقية بين العناصر
                    mainAxisSpacing: 10, // المسافة الرأسية بين العناصر
                    childAspectRatio:
                        0.8, // نسبة العرض إلى الارتفاع لكل عنصر (لجعلها مستطيلة قليلاً)
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return GestureDetector(
                      onTap: () {
                        bloc.category = category['name'];
                        bloc.selectedIcon = category['icon'];
                        bloc.selectedCategoryColor = category['color'];
                        bloc.color = category['color'];
                        // يمكنكِ إضافة منطق عند اختيار الفئة هنا
                        log('Category selected: ${category['name']}');
                        if (category['name'] == "Create New" ||
                            category['name'] == "إنشاء جديد") {
                          Navigator.pop(dialogContext);
                          createNweCatogry(contex2);
                        } else {
                          Navigator.pop(dialogContext);
                        } // إغلاق الـ Dialog عند الاختيار
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60, // حجم الخلفية الدائرية للأيقونة
                            height: 60,
                            decoration: BoxDecoration(
                              color: category['color'], // لون الخلفية
                              borderRadius: BorderRadius.circular(
                                16,
                              ), // حواف دائرية مربعة
                            ),
                            child: Icon(
                              category['icon'],
                              color:
                                  StyleColor.primaryBlackColor, // لون الأيقونة
                              size: 30, // حجم الأيقونة
                            ),
                          ),
                          const SizedBox(height: 8), // مسافة بين الأيقونة والنص
                          Text(
                            category['name'], // ترجمة اسم الفئة
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: StyleColor.primaryWhitelColor, // لون النص
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ), // مسافة بين الشبكة وزر "Add Category"
                // زر "Add Category"
                SizedBox(
                  width: double.infinity, // لجعل الزر يملأ العرض المتاح
                  child: ElevatedButton(
                    onPressed: () {
                      // يمكنكِ إضافة منطق لإضافة فئة جديدة هنا
                      log('Add Category button pressed');
                      Navigator.pop(dialogContext); // إغلاق الـ Dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          StyleColor.primaryPurpulColor, // لون الزر
                      foregroundColor:
                          StyleColor.primaryWhitelColor, // لون النص داخل الزر
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ), // حواف دائرية للزر
                      ),
                    ),
                    child: Text(
                      "Add Category".tr(),
                    ), // "Add Category" بدلاً من "clos"
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ////////////////////////////////////////////////////////
  ///after return
  ///

  taskMethod(BuildContext context, Task task) {
    final bloc = context.read<AddTaskBloc>();
    final context2=context;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            color: StyleColor.primaryBlackColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        StyleColor.primaryDarkGreyColor, // هذا هو لون الخلفية
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(color: Colors.grey),
                    ),
                    subtitle: Text(" ${task.dueDate}"),
                    trailing: IconButton(
                      //onPressed: showSheetInEdit(context, task),
                      onPressed: (){},
                      icon: Icon(Icons.edit),
                    ),
                  ),
                ),

                //
                TaskLittile(
                  onTap:() {
                    
                  },
                  leading: Icon(Icons.timer),
                  ttitle: "Task Time".tr(),
                  value: task.dueDate,
                ),
                SizedBox(height: 10),
                TaskLittile(
                   onTap:() {
                    
                  },
                  leading: Icon(Icons.category_outlined),
                  ttitle: "Task Category :".tr(),
                  value: task.catogryName,
                  taskCatograyng: bloc.availableIcons[task.iconlable],
                ),
                SizedBox(height: 10),
                TaskLittile(
                   onTap:() {
                    
                  },
                  leading: Icon(Icons.flag_outlined),
                  ttitle: "Task Priority :".tr(),
                  value: task.priority == 0
                      ? "defalut"
                      : task.priority.toString(),
                ),
                SizedBox(height: 10),
                TaskLittile(
                   onTap:() {
                    
                  },
                  leading: Icon(Icons.flag_outlined),
                  ttitle: "Sub - Task:".tr(),
                  value: "Add Sub - Task".tr(),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text(
                    "Delete Task".tr(),
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: 10),
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff8687E7),
                    ),
                    child: Text("Edit Task".tr(), textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showSheetInEdit(BuildContext context, Task task) {
    final bloc = context.read<AddTaskBloc>();
     // تأجيل تعديل حالة الـ Bloc إلى ما بعد اكتمال البناء
  WidgetsBinding.instance.addPostFrameCallback((_) {
    bloc.add(CatogryNameEvent(name: task.title));
    bloc.descriptionController.text = task.description;
  });
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: StyleColor.primaryBlackColor,
          height: context.getHeigth() * .4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment(-0.95, -.5),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Edit Task title".tr(),
                    style: TextStyle(
                      color: StyleColor.primaryWhitelColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: bloc.taskController,
                    decoration: InputDecoration(hintText: bloc.taskController.text),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.95, -.5),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Description".tr(),
                    style: TextStyle(
                      color: StyleColor.primaryWhitelColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: bloc.descriptionController,
                    decoration: InputDecoration(
                      hintText:  bloc.descriptionController.text,
                    ),
                  ),
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                   
                  },
                  child: Text("cancel".tr()),
                ),
                   ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // WidgetsBinding.instance.addPostFrameCallback((_) {
                    //   showDitePicker(context);
                    // });
                  },
                  child: Text("edit".tr()),
                ),
                ],
               )
              ],
            ),
          ),
        );
      },
    );
  }
  //////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        if (state is NavInitial) {
          final tasks = state.tasks ?? []; // قائمة المهام

          if (tasks.isEmpty) {
            // إذا كانت القائمة فارغة
            return _buildEmptyState(context);
          } else {
            // إذا كانت القائمة تحتوي على مهام
            return _buildTaskList(context, tasks);
          }
        }

        // في حال وجود حالة غير معروفة
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  // تصميم الشاشة الفارغة
  Widget _buildEmptyState(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskBloc(),
      child: BlocBuilder<AddTaskBloc, AddTaskState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => chosseCatogry(context),
                icon: Icon(Icons.filter_list),
              ),
              title: Text("Index".tr()),
              actions: [ClipOval(child: Image.asset('assets/images/10.png'))],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => showSheet(context),
              child: const Icon(Icons.add),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/9.png'),
                  const SizedBox(height: 15),
                  Text(
                    "What do you want to do today?".tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      color: Theme.of(
                        context,
                      ).textTheme.titleMedium!.color?.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Tap + to add your tasks".tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(
                        context,
                      ).textTheme.titleMedium!.color?.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // تصميم قائمة المهام
  Widget _buildTaskList(BuildContext context, List<Task> tasks) {
    return BlocProvider(
      create: (context) => AddTaskBloc(),
      child: BlocBuilder<AddTaskBloc, AddTaskState>(
        builder: (context, state) {
          final bloc = context.read<AddTaskBloc>();
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => chosseCatogry(context),
                icon: Icon(Icons.filter_list),
              ),
              title: Text("Index".tr()),
              actions: [ClipOval(child: Image.asset('assets/images/10.png'))],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => showSheet(context),
              child: const Icon(Icons.add),
            ),
            body: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        StyleColor.primaryDarkGreyColor, // هذا هو لون الخلفية
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // لجعل الحواف دائرية
                    // ...
                  ),
                  child: ListTile(
                    onTap: () => taskMethod(context, task),
                    leading: Radio(
                      value: task.isCompleted,
                      groupValue: true,
                      onChanged: (value) {
                        // منطق تحديث المهمة
                      },
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        color: task.isCompleted
                            ? Colors.grey
                            : Theme.of(context).textTheme.bodyLarge!.color,
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(" ${task.dueDate}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (task.catogryName != null) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: bloc.availableColors[task.catogryColor],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                // task.iconlable for color
                                Icon(bloc.availableIcons[task.iconlable]),
                                Text(
                                  task.catogryName,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: StyleColor.primaryDeepPurbleCollor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.flag_rounded, size: 16),
                              const SizedBox(width: 4),
                              Text(task.priority.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
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
